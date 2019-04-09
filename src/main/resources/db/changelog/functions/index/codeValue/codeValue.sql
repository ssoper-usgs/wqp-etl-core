create or replace function build_code_value_index(wqp_data_source character varying, schema_name character varying, base_table_name character varying)
returns void
language plpgsql
as $$
declare
	swap_table_name varchar := base_table_name || '_swap_' || wqp_data_source;
	index_name varchar := swap_table_name || '_code_value';
begin
	execute format('create index if not exists %I on %I.%I(code_value) with (fillfactor = 100)', index_name, schema_name, swap_table_name);
end
$$