//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: service.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Foundation
import GRPC
import NIO
import NIOHTTP1
import SwiftProtobuf


/// Usage: instantiate Nowaproto_NowaClient, then call methods of this protocol to make API calls.
public protocol Nowaproto_NowaClientProtocol {
  func getRestaurant(_ request: Nowaproto_GetRestaurantRequest, callOptions: CallOptions?) -> UnaryCall<Nowaproto_GetRestaurantRequest, Nowaproto_GetRestaurantResponse>
}

public final class Nowaproto_NowaClient: GRPCClient, Nowaproto_NowaClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions

  /// Creates a client for the nowaproto.Nowa service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  public init(channel: GRPCChannel, defaultCallOptions: CallOptions = CallOptions()) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
  }

  /// Gets a restaurant using the restaurant ID.
  ///
  /// - Parameters:
  ///   - request: Request to send to GetRestaurant.
  ///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func getRestaurant(_ request: Nowaproto_GetRestaurantRequest, callOptions: CallOptions? = nil) -> UnaryCall<Nowaproto_GetRestaurantRequest, Nowaproto_GetRestaurantResponse> {
    return self.makeUnaryCall(path: "/nowaproto.Nowa/GetRestaurant",
                              request: request,
                              callOptions: callOptions ?? self.defaultCallOptions)
  }

}

/// To build a server, implement a class that conforms to this protocol.
public protocol Nowaproto_NowaProvider: CallHandlerProvider {
  /// Gets a restaurant using the restaurant ID.
  func getRestaurant(request: Nowaproto_GetRestaurantRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Nowaproto_GetRestaurantResponse>
}

extension Nowaproto_NowaProvider {
  public var serviceName: String { return "nowaproto.Nowa" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handleMethod(_ methodName: String, callHandlerContext: CallHandlerContext) -> GRPCCallHandler? {
    switch methodName {
    case "GetRestaurant":
      return UnaryCallHandler(callHandlerContext: callHandlerContext) { context in
        return { request in
          self.getRestaurant(request: request, context: context)
        }
      }

    default: return nil
    }
  }
}


// Provides conformance to `GRPCPayload` for request and response messages
extension Nowaproto_GetRestaurantRequest: GRPCProtobufPayload {}
extension Nowaproto_GetRestaurantResponse: GRPCProtobufPayload {}

