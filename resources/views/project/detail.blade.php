@extends('layouts.layout')


@section('content')
<div class="container">
	<div class="row">
		    <div class="col-md-3">
          <div class="col-md-3 col-lg-3 " align="center">
        <img alt="Project Pic" src="{{ asset('uploads/' . $project->image) }}" width="200px"> </div>

        </div>
        <div class="col-md-9">
        <h2>{{ $project->title }}</h2>
                <div class=" col-md-12 col-lg-12 ">
                                <table class="table table-user-information table-hover" style="color: #000;font-size: 1.3em;">
                                    <tbody>
                                        <tr>
                                            <td>Code:</td>
                                            <td>{{ $project->code }}</td>
                                        </tr>
                                        <tr>
                                            <td>Subject Area:</td>
                                            <td>{{ $project->subject_area}}</td>
                                        </tr>
                                        <tr>
                                            <td>Objectives</td>
                                            <td>{{ $project->objectives }}</td>
                                        </tr>

                                        <tr>
                                            <tr>
                                                <td>Deliverables</td>
                                                <td>{{ $project->deliverables }}</td>
                                            </tr>
                                            <tr>
                                                <td>Environment</td>
                                                <td>{{ $project->environment }}</td>
                                            </tr>
                                            <tr>
                                                <td>Email</td>
                                                <td>
                                                @foreach($project->projectinvitation as $pdetail)
                                                <a href="mailto:{{$pdetail->email}}">{{$pdetail->email}}</a> ,
                                                @endforeach
                                                </td>
                                            </tr>
                                            <!-- <td>Phone Number</td>
                                            <td>123-4567-890(Landline)<br><br>555-4567-890(Mobile)
                                            </td>
 -->
 <td></td>
 <td></td>
                                        </tr>

                                    </tbody>
                                </table>
        </div>
	</div>
</div>
</div>
@endsection
