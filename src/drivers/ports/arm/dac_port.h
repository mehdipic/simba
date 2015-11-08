/**
 * @file drivers/dac_port.h
 * @version 1.0
 *
 * @section License
 * Copyright (C) 2014-2015, Erik Moqvist
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * This file is part of the Simba project.
 */

#ifndef __DRIVERS_DAC_PORT_H__
#define __DRIVERS_DAC_PORT_H__

struct dac_driver_t;

struct dac_device_t {
    struct {
        struct dac_driver_t *head_p;
        struct dac_driver_t *tail_p;
    } jobs;
};

struct dac_driver_t {
    struct dac_device_t *dev_p;
    struct pin_driver_t pin_drv;
};

#endif
