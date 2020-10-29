// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class DiscoverChannelsFeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query DiscoverChannelsFeed($after: String) {
      discoverChannelsFeed(after: $after) {
        __typename
        edges {
          __typename
          cursor
          node {
            __typename
            id
            title
            content
            author {
              __typename
              name
              avatar {
                __typename
                big
              }
            }
            video {
              __typename
              cover {
                __typename
                thumbnails {
                  __typename
                  big {
                    __typename
                    url
                  }
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "DiscoverChannelsFeed"

  public var after: String?

  public init(after: String? = nil) {
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("discoverChannelsFeed", arguments: ["after": GraphQLVariable("after")], type: .nonNull(.object(DiscoverChannelsFeed.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(discoverChannelsFeed: DiscoverChannelsFeed) {
      self.init(unsafeResultMap: ["__typename": "Query", "discoverChannelsFeed": discoverChannelsFeed.resultMap])
    }

    /// Returns published posts from channels(without following channels and controlled channels)
    public var discoverChannelsFeed: DiscoverChannelsFeed {
      get {
        return DiscoverChannelsFeed(unsafeResultMap: resultMap["discoverChannelsFeed"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "discoverChannelsFeed")
      }
    }

    public struct DiscoverChannelsFeed: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LongPostList"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "LongPostList", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LongPostEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(cursor: String, node: Node) {
          self.init(unsafeResultMap: ["__typename": "LongPostEdge", "cursor": cursor, "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var cursor: String {
          get {
            return resultMap["cursor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cursor")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["LongPost"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("content", type: .nonNull(.scalar(String.self))),
              GraphQLField("author", type: .nonNull(.object(Author.selections))),
              GraphQLField("video", type: .object(Video.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, title: String, content: String, author: Author, video: Video? = nil) {
            self.init(unsafeResultMap: ["__typename": "LongPost", "id": id, "title": title, "content": content, "author": author.resultMap, "video": video.flatMap { (value: Video) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var title: String {
            get {
              return resultMap["title"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          public var content: String {
            get {
              return resultMap["content"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }

          public var author: Author {
            get {
              return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "author")
            }
          }

          public var video: Video? {
            get {
              return (resultMap["video"] as? ResultMap).flatMap { Video(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "video")
            }
          }

          public struct Author: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Channel"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .object(Avatar.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, avatar: Avatar? = nil) {
              self.init(unsafeResultMap: ["__typename": "Channel", "name": name, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var avatar: Avatar? {
              get {
                return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
              }
            }

            public struct Avatar: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Avatar"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("big", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(big: String) {
                self.init(unsafeResultMap: ["__typename": "Avatar", "big": big])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var big: String {
                get {
                  return resultMap["big"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "big")
                }
              }
            }
          }

          public struct Video: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["AttachmentVideo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("cover", type: .object(Cover.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(cover: Cover? = nil) {
              self.init(unsafeResultMap: ["__typename": "AttachmentVideo", "cover": cover.flatMap { (value: Cover) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var cover: Cover? {
              get {
                return (resultMap["cover"] as? ResultMap).flatMap { Cover(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "cover")
              }
            }

            public struct Cover: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Cover"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("thumbnails", type: .nonNull(.object(Thumbnail.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(thumbnails: Thumbnail) {
                self.init(unsafeResultMap: ["__typename": "Cover", "thumbnails": thumbnails.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var thumbnails: Thumbnail {
                get {
                  return Thumbnail(unsafeResultMap: resultMap["thumbnails"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "thumbnails")
                }
              }

              public struct Thumbnail: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Thumbnails"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("big", type: .nonNull(.object(Big.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(big: Big) {
                  self.init(unsafeResultMap: ["__typename": "Thumbnails", "big": big.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var big: Big {
                  get {
                    return Big(unsafeResultMap: resultMap["big"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "big")
                  }
                }

                public struct Big: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["AttachmentImageThumbnail"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("url", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(url: String) {
                    self.init(unsafeResultMap: ["__typename": "AttachmentImageThumbnail", "url": url])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var url: String {
                    get {
                      return resultMap["url"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "url")
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class DiscoverFastFoodFeedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query DiscoverFastFoodFeed($after: String = null) {
      discoverFastFoodFeed(after: $after) {
        __typename
        edges {
          __typename
          cursor
          node {
            __typename
            id
            files {
              __typename
              ... on AttachmentImage {
                url
              }
              ... on AttachmentVideo {
                cover {
                  __typename
                  thumbnails {
                    __typename
                    big {
                      __typename
                      url
                    }
                  }
                }
              }
            }
            author {
              __typename
              name
            }
            caption
          }
        }
      }
    }
    """

  public let operationName: String = "DiscoverFastFoodFeed"

  public var after: String?

  public init(after: String? = nil) {
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("discoverFastFoodFeed", arguments: ["after": GraphQLVariable("after")], type: .nonNull(.object(DiscoverFastFoodFeed.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(discoverFastFoodFeed: DiscoverFastFoodFeed) {
      self.init(unsafeResultMap: ["__typename": "Query", "discoverFastFoodFeed": discoverFastFoodFeed.resultMap])
    }

    /// Returns published posts from users(without current user and followings) profiles and specific category
    public var discoverFastFoodFeed: DiscoverFastFoodFeed {
      get {
        return DiscoverFastFoodFeed(unsafeResultMap: resultMap["discoverFastFoodFeed"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "discoverFastFoodFeed")
      }
    }

    public struct DiscoverFastFoodFeed: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ShortPostList"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "ShortPostList", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ShortPostEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(cursor: String, node: Node) {
          self.init(unsafeResultMap: ["__typename": "ShortPostEdge", "cursor": cursor, "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var cursor: String {
          get {
            return resultMap["cursor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cursor")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ShortPost"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLField("files", type: .nonNull(.list(.nonNull(.object(File.selections))))),
              GraphQLField("author", type: .nonNull(.object(Author.selections))),
              GraphQLField("caption", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, files: [File], author: Author, caption: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "ShortPost", "id": id, "files": files.map { (value: File) -> ResultMap in value.resultMap }, "author": author.resultMap, "caption": caption])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var files: [File] {
            get {
              return (resultMap["files"] as! [ResultMap]).map { (value: ResultMap) -> File in File(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: File) -> ResultMap in value.resultMap }, forKey: "files")
            }
          }

          public var author: Author {
            get {
              return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "author")
            }
          }

          public var caption: String? {
            get {
              return resultMap["caption"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "caption")
            }
          }

          public struct File: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["AttachmentImage", "AttachmentVideo"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLTypeCase(
                  variants: ["AttachmentImage": AsAttachmentImage.selections, "AttachmentVideo": AsAttachmentVideo.selections],
                  default: [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  ]
                )
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public static func makeAttachmentImage(url: String) -> File {
              return File(unsafeResultMap: ["__typename": "AttachmentImage", "url": url])
            }

            public static func makeAttachmentVideo(cover: AsAttachmentVideo.Cover? = nil) -> File {
              return File(unsafeResultMap: ["__typename": "AttachmentVideo", "cover": cover.flatMap { (value: AsAttachmentVideo.Cover) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var asAttachmentImage: AsAttachmentImage? {
              get {
                if !AsAttachmentImage.possibleTypes.contains(__typename) { return nil }
                return AsAttachmentImage(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAttachmentImage: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AttachmentImage"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String) {
                self.init(unsafeResultMap: ["__typename": "AttachmentImage", "url": url])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }
            }

            public var asAttachmentVideo: AsAttachmentVideo? {
              get {
                if !AsAttachmentVideo.possibleTypes.contains(__typename) { return nil }
                return AsAttachmentVideo(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap = newValue.resultMap
              }
            }

            public struct AsAttachmentVideo: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["AttachmentVideo"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("cover", type: .object(Cover.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(cover: Cover? = nil) {
                self.init(unsafeResultMap: ["__typename": "AttachmentVideo", "cover": cover.flatMap { (value: Cover) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var cover: Cover? {
                get {
                  return (resultMap["cover"] as? ResultMap).flatMap { Cover(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "cover")
                }
              }

              public struct Cover: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Cover"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("thumbnails", type: .nonNull(.object(Thumbnail.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(thumbnails: Thumbnail) {
                  self.init(unsafeResultMap: ["__typename": "Cover", "thumbnails": thumbnails.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var thumbnails: Thumbnail {
                  get {
                    return Thumbnail(unsafeResultMap: resultMap["thumbnails"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "thumbnails")
                  }
                }

                public struct Thumbnail: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Thumbnails"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("big", type: .nonNull(.object(Big.selections))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(big: Big) {
                    self.init(unsafeResultMap: ["__typename": "Thumbnails", "big": big.resultMap])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var big: Big {
                    get {
                      return Big(unsafeResultMap: resultMap["big"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "big")
                    }
                  }

                  public struct Big: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["AttachmentImageThumbnail"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("url", type: .nonNull(.scalar(String.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(url: String) {
                      self.init(unsafeResultMap: ["__typename": "AttachmentImageThumbnail", "url": url])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    public var url: String {
                      get {
                        return resultMap["url"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "url")
                      }
                    }
                  }
                }
              }
            }
          }

          public struct Author: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Person"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "Person", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }
      }
    }
  }
}
