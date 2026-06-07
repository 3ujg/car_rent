# Mockaroo prompt for `reservations`

Generate realistic sample data for a MySQL `reservations` table for a car rental app.

Requirements:

- Create 20 to 80 rows.
- Each row must reference a valid `user_id` and `car_id`.
- Keep `start_date` and `end_date` chronological, with `end_date` on or after `start_date`.
- Avoid overlapping date ranges for the same `car_id`.
- Set `status` to one of `pending`, `active`, `cancelled`, `completed`.
- Make `total_price` consistent with the car's `price_per_day` multiplied by the number of rental days.
- Use recent and believable dates.
- Keep the generated data clean and valid for import into MySQL.

Output fields:

- `id`
- `user_id`
- `car_id`
- `start_date`
- `end_date`
- `total_price`
- `status`
- `created_at`
