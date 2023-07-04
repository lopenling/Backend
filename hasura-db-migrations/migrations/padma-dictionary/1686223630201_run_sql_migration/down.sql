-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION add_org_member()
--     RETURNS trigger AS $BODY$
--     BEGIN
--         IF (TG_OP = 'INSERT') THEN
--             INSERT INTO organization_member values (NEW.admin_id, NEW.id);
--             IF (NEW.same_as_team) THEN
--                 INSERT INTO team values (NEW.name, NEW.logo, NEW.admin_id, NEW.id );
--             END IF;
--             RETURN NEW;
--         ELSEIF (TG_OP = 'UPDATE') THEN
--             UPDATE organization_member
--                 SET user_id = NEW.admin_id,
--                     organization_id = NEW.id
--                 WHERE user_id = NEW.admin_id AND organization_id = NEW.id;
--             RETURN NEW;
--         END IF;
--
--     END;
--     $BODY$ LANGUAGE plpgsql;
--
-- CREATE TRIGGER add_member
--     AFTER INSERT OR UPDATE ON "organization"
--     FOR EACH ROW EXECUTE PROCEDURE add_org_member();
