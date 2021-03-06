function volume = polyhedron_volume_3d_2 ( coord, maxorder, face_num, node, ...
  node_num, order )

%*****************************************************************************80
%
%% POLYHEDRON_VOLUME_3D_2 computes the volume of a polyhedron in 3D.
%
%  Discussion:
%
%    The computation is not valid unless the faces of the polyhedron
%    are planar polygons.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Allen Van Gelder,
%    Efficient Computation of Polygon Area and Polyhedron Volume,
%    Graphics Gems V, edited by Alan Paeth,
%    AP Professional, 1995.
%
%  Parameters:
%
%    Input, real COORD(3,NODE_NUM), the vertices.
%    The vertices may be listed in any order.
%
%    Input, integer MAXORDER, the maximum number of vertices that make
%    up a face of the polyhedron.
%
%    Input, integer FACE_NUM, the number of faces of the polyhedron.
%
%    Input, integer NODE(FACE_NUM,MAXORDER).  Face I is defined by
%    the vertices NODE(I,1) through NODE(I,ORDER(I)).  These vertices
%    are listed in neighboring order.
%
%    Input, integer NODE_NUM, the number of points stored in COORD.
%
%    Input, integer ORDER(FACE_NUM), the number of vertices making up
%    each face.
%
%    Output, real VOLUME, the volume of the polyhedron.
%
  dim_num = 3;

  volume = 0.0;

  for face = 1 : face_num

    v(1:dim_num) = 0.0;
%
%  Compute the area vector for this face.
%
    for j = 1 : order(face)

      k1 = node(face,j);

      if ( j < order(face) )
        k2 = node(face,j+1);
      else
        k2 = node(face,1);
      end
%
%  Compute the cross product.
%
      normal(1) = coord(2,k1) * coord(3,k2) - coord(3,k1) * coord(2,k2);
      normal(2) = coord(3,k1) * coord(1,k2) - coord(1,k1) * coord(3,k2);
      normal(3) = coord(1,k1) * coord(2,k2) - coord(2,k1) * coord(1,k2);

      v(1:dim_num) = v(1:dim_num) + normal(1:dim_num);

    end
%
%  Area vector dot any vertex.
%
    k = node(face,1);
    volume = volume + v(1:dim_num) * coord(1:dim_num,k);

  end

  volume = volume / 6.0;

  return
end
