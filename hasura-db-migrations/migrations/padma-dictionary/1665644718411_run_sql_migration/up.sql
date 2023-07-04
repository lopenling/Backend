CREATE OR REPLACE FUNCTION add_team_member()
    RETURNS trigger AS $BODY$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO team_member values (NEW.admin_id, NEW.id);
            RETURN NEW;
        ELSEIF (TG_OP = 'UPDATE') THEN
            UPDATE team_member
                SET user_id = NEW.admin_id,
                    team_id = NEW.id
                WHERE user_id = NEW.admin_id AND team_id = NEW.id;
            RETURN NEW;
        END IF;
        
    END;
    $BODY$ LANGUAGE plpgsql;
