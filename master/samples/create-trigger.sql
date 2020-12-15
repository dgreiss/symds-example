CREATE SCHEMA client;
INSERT INTO sym_node (node_id, node_group_id, external_id, sync_enabled)
VALUES ('client', 'client', 'client', 1);

INSERT INTO sym_node_group(node_group_id, create_time, last_update_time)
VALUES ('client', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action, sync_config_enabled, is_reversible, create_time, last_update_time)
VALUES ('master', 'client', 'W', 1, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action, sync_config_enabled, is_reversible, create_time, last_update_time)
VALUES ('client', 'master', 'P', 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sym_router (router_id, target_schema_name, source_node_group_id, target_node_group_id, use_source_catalog_schema, create_time, last_update_time)
VALUES ('client-to-master', 'client', 'client', 'master', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sym_trigger (trigger_id, source_table_name, channel_id, create_time, last_update_time)
VALUES ('client-table', 'item', 'default', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO sym_trigger_router (trigger_id, router_id, create_time, last_update_time)
VALUES ('client-table', 'client-to-master', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);