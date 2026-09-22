CREATE TABLE report_status_history (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    report_id INT UNSIGNED NOT NULL,

    status VARCHAR(50) NOT NULL,
    remarks TEXT NULL,

    updated_by INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_status_history_report
        FOREIGN KEY (report_id)
        REFERENCES waste_reports(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_status_history_user
        FOREIGN KEY (updated_by)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX idx_status_history_report_id
    ON report_status_history(report_id);

CREATE INDEX idx_status_history_updated_by
    ON report_status_history(updated_by);