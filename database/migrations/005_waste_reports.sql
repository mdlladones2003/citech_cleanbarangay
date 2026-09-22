CREATE TABLE waste_reports (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    location_id INT UNSIGNED NOT NULL,

    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,

    status ENUM(
        'submitted',
        'under_review',
        'verified',
        'assigned',
        'in_progress',
        'resolved',
        'closed',
        'rejected'
    ) DEFAULT 'submitted',

    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_reports_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_reports_category
        FOREIGN KEY (category_id)
        REFERENCES waste_categories(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_reports_location
        FOREIGN KEY (location_id)
        REFERENCES locations(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX idx_reports_user_id ON waste_reports(user_id);
CREATE INDEX idx_reports_category_id ON waste_reports(category_id);
CREATE INDEX idx_reports_location_id ON waste_reports(location_id);
CREATE INDEX idx_reports_status ON waste_reports(status);
CREATE INDEX idx_reports_submitted_at ON waste_reports(submitted_at);