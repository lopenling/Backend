import { BaseSchema } from '@adonisjs/lucid/schema'

export default class extends BaseSchema {
  protected tableName = 'users'

  async up() {
    this.schema.createTable(this.tableName, (table) => {
      table.increments('id').notNullable()

      table.string('first_name').nullable()
      table.string('last_name').nullable()

      table.string('avatar').nullable()
      table.string('default_login_method').defaultTo('magic_link')

      table.string('email', 254).notNullable().unique()
      table.string('password').nullable()

      table.timestamp('created_at').notNullable()
      table.timestamp('updated_at').nullable()
    })
  }

  async down() {
    this.schema.dropTable(this.tableName)
  }
}
