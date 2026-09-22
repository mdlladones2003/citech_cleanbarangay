CREATE TABLE report_actions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    report_id INT UNSIGNED NOT NULL,
    staff_id INT UNSIGNED NOT NULL,

    action_taken TEXT NOT NULL,
    remarks TEXT NULL,

    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_report_actions_report
        FOREIGN KEY (report_id)
        REFERENCES waste_reports(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_report_actions_staff
        FOREIGN KEY (staff_id)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX idx_report_actions_report_id
    ON report_actions(report_id);

CREATE INDEX idx_report_actions_staff_id
    ON report_actions(staff_id);