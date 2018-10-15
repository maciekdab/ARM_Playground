#include <mbed.h>
#include <Servo.h>
#include <IRremote.h>
#include "bell.h"

//#define DEBUG_APP

#ifdef DEBUG_APP
Serial debug_app(USBTX, USBRX);
#endif

// ----------- Audio -----------
#define SAMPLERATE 22050.0f
Ticker sample_ticker;
PwmOut speaker(PA_1);
bool is_playing = false;
unsigned long sample_index = 0;
// -----------------------------

// ----- Railroad gate ---------
#define UP      0
#define DOWN    1
#define GATE_START_POS  0.0f
#define GATE_END_POS    0.72f
Servo gate(PA_6);
Ticker gate_ticker;
float direction;
unsigned char gate_state;
// -----------------------------

// ----- Railroad lights -------
Ticker leds_ticker;
DigitalOut lower_light_left(PB_8);
DigitalOut lower_light_right(PB_9);
// -----------------------------

// ----------- IR -------------
#define REMOTE_KEYPRESS_CODE 0x22AE7A29
IRrecv irrecv(PA_0);
decode_results ir_result;
// -----------------------------

void leds_flash_ticker() {
    lower_light_left = !lower_light_left;
    lower_light_right = !lower_light_left;
}

void run_lights() {
    leds_ticker.attach(&leds_flash_ticker, 1.0f);
}

void stop_lights() {
    lower_light_left = 0;
    lower_light_right = 0;
    leds_ticker.detach();
}

void play_sample_ticker() {
    static unsigned long sample_index = 0;
    speaker = data[sample_index] / 255.0f;
    if(++sample_index >= SND_DATA_SAMPLES) {
        sample_index = 0;
    }
}

void play_sounds() {
    speaker.period(1.0f / 250000.0f);
    sample_ticker.attach(&play_sample_ticker, 1.0f / SAMPLERATE);
    is_playing = true;
}

void stop_playing_sounds() {
    sample_ticker.detach();
    sample_index = 0;
    is_playing = false;
}

void gate_control_ticker() {
    gate = gate + direction * 0.001f;
    
    if(gate >= GATE_END_POS) {
        gate_ticker.detach();
        gate = GATE_END_POS;
        gate_state = DOWN;
    }
    
    if(gate <= GATE_START_POS) {
        gate_ticker.detach();
        gate = GATE_START_POS;
        gate_state = UP;
        stop_playing_sounds();
        stop_lights();
    }
    
#ifdef DEBUG_APP
    debug_app.printf("[DEBUG] Gate position: %.2f\r\n", gate.read());
#endif    
}

void gate_up() {
    direction = -1.0f;
    gate_ticker.attach(&gate_control_ticker, 0.004f);
    play_sounds();
    run_lights();
}
    
void gate_down() {
    direction = 1.0f;
    gate_ticker.attach(&gate_control_ticker, 0.004f);
    play_sounds();
    run_lights();
}

#ifdef DEBUG_APP
void test_gate_up() {
    debug_app.printf("[DEBUG] GATE GOING UP!\r\n");
    gate_up();
    while(gate_state != UP) {
        debug_app.printf("[DEBUG] Gate position: %.2f\r\n", gate.read());
    }
}

void test_gate_down() {
    debug_app.printf("[DEBUG] GATE GOING DOWN!\r\n");
    gate_down();
    while(gate_state != DOWN) {
        debug_app.printf("[DEBUG] Gate position: %.2f\r\n", gate.read());
    }
}
#endif

bool ir_key_match() {
    unsigned long key_code = 0;
    
    if(irrecv.decode(&ir_result)) {
        // process decoded ir result: ir_result.value
    #ifdef DEBUG_APP
        debug_app.printf("[DEBUG] Received IR code: %X\r\n", ir_result.value);
    #endif
        key_code = ir_result.value;
        irrecv.resume();
    }
    
    return (key_code == REMOTE_KEYPRESS_CODE);
}

void init() {
    irrecv.enableIRIn();
    stop_playing_sounds();
    stop_lights();
    gate = GATE_START_POS;
    gate_state = UP;
}

int main() {
    init();       
    while(true) {
        if(ir_key_match()) {
            if(gate_state == UP) {
                gate_down();
             }
        
            if(gate_state == DOWN) {
                gate_up();
            }
        }
    }
}
