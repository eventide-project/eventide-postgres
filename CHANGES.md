# Eventide Postgres Changes

### 2.0.1.0

Wed Oct 12 2022

Updates to the message_store and message_store-postgres libraries to support Message DB [v1.3.0](https://github.com/message-db/message-db/releases/tag/v1.3.0).

The message_store-postgres library’s Get::Stream::Last class’s actuator supports an optional parameter named `type`. This is in addition to the `stream_name` parameter that has always been part of the Get::Stream::Last actuator’s signature.

Libraries affected:

- message-store (v2.3.2.0)
- message-store-postgres (v2.4.4.0)

### 2.0.0.0

December 2019

WARNING:

The Eventide v2 code is incompatible with a v1 message store database. Don't update the Eventide toolkit code until you're ready to update your message store database.

## Test Bench

All tests in the v2 stack have been ported and updated to the new version of [Test Bench](https://github.com/test-bench/test-bench) released in October, 2019.

## Postgres Message Store

- This library is deprecated. It's replaced with Message DB: [https://github.com/message-db/message-db](https://github.com/message-db/message-db)

## Message DB

- Formerly, `postgres-message-store` (see above).
- **Note: There are no changes to the `messages` table, and no data migration is necessary**
- **An update tool is provided to make the structural upgrades to the database**
- The executables named `evt-pg-*` are renamed to `mdb-*`
- **[breaking change]** The `get_category_messages` server function supports pub/sub directly by receiving a `correlation` argument and composing the correlation metadata query condition directly in the server function ([http://docs.eventide-project.org/user-guide/message-store/server-functions.html#get-messages-from-a-stream](http://docs.eventide-project.org/user-guide/message-store/server-functions.html#get-messages-from-a-stream))
- **[breaking change]** The message_store database and its objects are contained in a Postgres schema named `message_store`
- **[breaking change]** The `get_category_messages` server function supports consumer groups via the `consumer_group_member` and `consumer_group_size` parameters ([http://docs.eventide-project.org/user-guide/message-store/server-functions.html#get-messages-from-a-category](http://docs.eventide-project.org/user-guide/message-store/server-functions.html#get-messages-from-a-category))
- The retrieval server functions provide debugging output that is activated via the Postgres setting, `message_store.debug_get` ([http://docs.eventide-project.org/user-guide/message-store/server-functions.html#debugging-output](http://docs.eventide-project.org/user-guide/message-store/server-functions.html#debugging-output))
- The write server function provides debugging output that is activated via the Postgres setting, `message_store.debug_write` ([http://docs.eventide-project.org/user-guide/message-store/server-functions.html#debugging-output](http://docs.eventide-project.org/user-guide/message-store/server-functions.html#debugging-output))
- The `message_store.debug` Postgres setting activates both the retrieval and write debug output ([http://docs.eventide-project.org/user-guide/message-store/server-functions.html#debugging-output](http://docs.eventide-project.org/user-guide/message-store/server-functions.html#debugging-output))
- `id` stream parsing function ([http://docs.eventide-project.org/user-guide/message-store/server-functions.html#get-the-id-from-a-stream-name](http://docs.eventide-project.org/user-guide/message-store/server-functions.html#get-the-id-from-a-stream-name))
- `cardinal_id` stream parsing function ([http://docs.eventide-project.org/user-guide/message-store/server-functions.html#get-the-cardinal-id-from-a-stream-name](http://docs.eventide-project.org/user-guide/message-store/server-functions.html#get-the-cardinal-id-from-a-stream-name))
- `acquire_lock` function encapsulates the application of the advisory lock used by the `write_message` function ([http://docs.eventide-project.org/user-guide/message-store/server-functions.html#get-message-store-database-schema-version](http://docs.eventide-project.org/user-guide/message-store/server-functions.html#get-message-store-database-schema-version))
- Database management tool output is clarified
- **[breaking change]** All server function parameter names are no longer named with underscore prefixes ([http://docs.eventide-project.org/user-guide/message-store/server-functions.html](http://docs.eventide-project.org/user-guide/message-store/server-functions.html))
- Indexes are no longer built with the `CONCURRENTLY` option ([http://docs.eventide-project.org/user-guide/message-store/anatomy.html#source-code](http://docs.eventide-project.org/user-guide/message-store/anatomy.html#source-code))
- **[breaking change]** The `messages_category_global_position_idx` is removed and replaced with the `messages_category` index, which now indexes correlation metadata
- **[breaking change]** The `messages_stream_name_position_uniq_idx` is removed and replaced with the `messages_stream` index, which now indexes correlation metadata
- **[breaking change]** The `messages_id_uniq_idx` is removed and replaced with the `messages_id` index
- Message DB RubyGem: [https://github.com/message-db/ruby-gem](https://github.com/message-db/ruby-gem)
- Message DB NPM Module: [https://github.com/message-db/npm-module](https://github.com/message-db/npm-module)
- Improvements to interactive tests ([https://github.com/eventide-project/postgres-message-store/tree/master/test](https://github.com/eventide-project/postgres-message-store/tree/master/test))

## Message Store Client

- `MessageStore::Postgres::Get` receives the `correlation` argument and passes it to the message store database's retrieval functions ([http://docs.eventide-project.org/user-guide/retrieving/batch.html#retrieving-correlated-messages](http://docs.eventide-project.org/user-guide/retrieving/batch.html#retrieving-correlated-messages))
- `MessageStore::Postgres::Get` receives the `consumer_group_member` and `consumer_group_size` arguments and passes it to the message store database's retrieval functions ([http://docs.eventide-project.org/user-guide/retrieving/batch.html#consumer-groups](http://docs.eventide-project.org/user-guide/retrieving/batch.html#consumer-groups))
- Stream name utilities now support stream name with compound IDs ([http://docs.eventide-project.org/user-guide/stream-names/message-store-stream-name.html#stream-name](http://docs.eventide-project.org/user-guide/stream-names/message-store-stream-name.html#stream-name))
- Cardinal IDs are formalized as part of the stream name utilities ([http://docs.eventide-project.org/user-guide/stream-names/message-store-stream-name.html#stream-name](http://docs.eventide-project.org/user-guide/stream-names/message-store-stream-name.html#stream-name))
- Concrete `Get::Category` and `Get::Stream` classes can be constructed, configured, and used directly without using the abstract `Get` factory
- Correlation is supported exclusively by the `Get::Category` implementation
- Consumer groups are supported exclusively by the `Get::Category` implementation

## Messaging

- Stream name composition and parsing supports all same features as the stream name composition and parsing in the message store library ([http://docs.eventide-project.org/user-guide/stream-names/messaging-stream-name.html](http://docs.eventide-project.org/user-guide/stream-names/messaging-stream-name.html))

## Consumer

- **[breaking change]** Entity stream names are no longer supported by consumers ([http://docs.eventide-project.org/user-guide/consumers.html](http://docs.eventide-project.org/user-guide/consumers.html))
- Correlation query conditions are no longer composed in the consumer and passed to the message store database server functions. The message store database composes the correlation query conditions within its server functions.
- Consumer group query conditions are no longer composed in the consumer and passed to the message store database server functions. The message store database composes the correlation query conditions within its server functions.

## Documentation

- [Message DB](http://docs.eventide-project.org/user-guide/message-db/) documentation is improved
- The `MessageStore::Postgres::Get` module is documented ([http://docs.eventide-project.org/user-guide/retrieving/batch.html](http://docs.eventide-project.org/user-guide/retrieving/batch.html))
- Debugging output for the Postgres server functions is documented ([http://docs.eventide-project.org/user-guide/message-store/server-functions.html#debugging-output](http://docs.eventide-project.org/user-guide/message-store/server-functions.html#debugging-output))
- Stream name utilities documentation is updated and improved: [http://docs.eventide-project.org/user-guide/stream-names](http://docs.eventide-project.org/user-guide/stream-names/)
- Consumer user guide is improved and is more consistent with `MessageStore::Postgres::Get` documentation: [http://docs.eventide-project.org/user-guide/consumers.html](http://docs.eventide-project.org/user-guide/consumers.html)
- The settings file location override is documented ([http://docs.eventide-project.org/user-guide/session.html#overriding-the-setting-file-location](http://docs.eventide-project.org/user-guide/session.html#overriding-the-setting-file-location))
