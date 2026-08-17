unit uDbParamcota;

interface

uses
   uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
   TDbParamcota = class(TCmDbObject)

   private
      FDtabreimob: TCmDbField;
      FDtabrefundodic: TCmDbField;
      FDtprimfundoimob: TCmDbField;
      FDtabrerv: TCmDbField;
      FDtfechafundorv: TCmDbField;
      FDtprimrf: TCmDbField;
      FDtprimimob: TCmDbField;
      FDtfechamanual: TCmDbField;
      FDtprimmanual: TCmDbField;
      FDtprimrv: TCmDbField;
      FDtfechafundorf: TCmDbField;
      FDtfechafundoimob: TCmDbField;
      FDtfechaimob: TCmDbField;
      FDtabrefundorv: TCmDbField;
      FDtfechabmf: TCmDbField;
      FDtprimep: TCmDbField;
      FDtfechafundodic: TCmDbField;
      FDtabrefundoimob: TCmDbField;
      FDtprimfundorv: TCmDbField;
      FDtabreep: TCmDbField;
      FDtfecharv: TCmDbField;
      FIdempresaprop: TCmDbField;
      FDtprimfundorf: TCmDbField;
      FDtfecharf: TCmDbField;
      FDtabrebmf: TCmDbField;
      FDtfechaep: TCmDbField;
      FDtprimfundodic: TCmDbField;
      FDtabremanual: TCmDbField;
      FDtabrefundorf: TCmDbField;
      FDtabrerf: TCmDbField;
      FDtprimbmf: TCmDbField;
      FIdGrupoRegra: TCmDbField;
      FIdTipoRegra: TCmDbField;
      FFlgCotizaDataAnt: TCmDbField;
      FFlgDiaUtil: TCmDbField;
      FVlrPrimeira: TCmDbField;
      FDtPrimeira: TCmDbField;

      procedure SetDtabrebmf(const Value: TCmDbField);
      procedure SetDtabreep(const Value: TCmDbField);
      procedure SetDtabrefundodic(const Value: TCmDbField);
      procedure SetDtabrefundoimob(const Value: TCmDbField);
      procedure SetDtabrefundorf(const Value: TCmDbField);
      procedure SetDtabrefundorv(const Value: TCmDbField);
      procedure SetDtabreimob(const Value: TCmDbField);
      procedure SetDtabremanual(const Value: TCmDbField);
      procedure SetDtabrerf(const Value: TCmDbField);
      procedure SetDtabrerv(const Value: TCmDbField);
      procedure SetDtfechabmf(const Value: TCmDbField);
      procedure SetDtfechaep(const Value: TCmDbField);
      procedure SetDtfechafundodic(const Value: TCmDbField);
      procedure SetDtfechafundoimob(const Value: TCmDbField);
      procedure SetDtfechafundorf(const Value: TCmDbField);
      procedure SetDtfechafundorv(const Value: TCmDbField);
      procedure SetDtfechaimob(const Value: TCmDbField);
      procedure SetDtfechamanual(const Value: TCmDbField);
      procedure SetDtfecharf(const Value: TCmDbField);
      procedure SetDtfecharv(const Value: TCmDbField);
      procedure SetDtprimbmf(const Value: TCmDbField);
      procedure SetDtprimep(const Value: TCmDbField);
      procedure SetDtprimfundodic(const Value: TCmDbField);
      procedure SetDtprimfundoimob(const Value: TCmDbField);
      procedure SetDtprimfundorf(const Value: TCmDbField);
      procedure SetDtprimfundorv(const Value: TCmDbField);
      procedure SetDtprimimob(const Value: TCmDbField);
      procedure SetDtprimmanual(const Value: TCmDbField);
      procedure SetDtprimrf(const Value: TCmDbField);
      procedure SetDtprimrv(const Value: TCmDbField);
      procedure SetIdempresaprop(const Value: TCmDbField);
      procedure SetIdGrupoRegra(const Value: TCmDbField);
      procedure SetIdTipoRegra(const Value: TCmDbField);
      procedure SetDtPrimeira(const Value: TCmDbField);
      procedure SetFlgCotizaDataAnt(const Value: TCmDbField);
      procedure SetFlgDiaUtil(const Value: TCmDbField);
      procedure SetVlrPrimeira(const Value: TCmDbField);

   public

       property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
       property Dtprimrv: TCmDbField read FDtprimrv write SetDtprimrv;
       property Dtprimrf: TCmDbField read FDtprimrf write SetDtprimrf;
       property Dtprimmanual: TCmDbField read FDtprimmanual write SetDtprimmanual;
       property Dtprimimob: TCmDbField read FDtprimimob write SetDtprimimob;
       property Dtprimfundorv: TCmDbField read FDtprimfundorv write SetDtprimfundorv;
       property Dtprimfundorf: TCmDbField read FDtprimfundorf write SetDtprimfundorf;
       property Dtprimfundoimob: TCmDbField read FDtprimfundoimob write SetDtprimfundoimob;
       property Dtprimfundodic: TCmDbField read FDtprimfundodic write SetDtprimfundodic;
       property Dtprimep: TCmDbField read FDtprimep write SetDtprimep;
       property Dtprimbmf: TCmDbField read FDtprimbmf write SetDtprimbmf;
       property Dtfecharv: TCmDbField read FDtfecharv write SetDtfecharv;
       property Dtfecharf: TCmDbField read FDtfecharf write SetDtfecharf;
       property Dtfechamanual: TCmDbField read FDtfechamanual write SetDtfechamanual;
       property Dtfechaimob: TCmDbField read FDtfechaimob write SetDtfechaimob;
       property Dtfechafundorv: TCmDbField read FDtfechafundorv write SetDtfechafundorv;
       property Dtfechafundorf: TCmDbField read FDtfechafundorf write SetDtfechafundorf;
       property Dtfechafundoimob: TCmDbField read FDtfechafundoimob write SetDtfechafundoimob;
       property Dtfechafundodic: TCmDbField read FDtfechafundodic write SetDtfechafundodic;
       property Dtfechaep: TCmDbField read FDtfechaep write SetDtfechaep;
       property Dtfechabmf: TCmDbField read FDtfechabmf write SetDtfechabmf;
       property Dtabrerv: TCmDbField read FDtabrerv write SetDtabrerv;
       property Dtabrerf: TCmDbField read FDtabrerf write SetDtabrerf;
       property Dtabremanual: TCmDbField read FDtabremanual write SetDtabremanual;
       property Dtabreimob: TCmDbField read FDtabreimob write SetDtabreimob;
       property Dtabrefundorv: TCmDbField read FDtabrefundorv write SetDtabrefundorv;
       property Dtabrefundorf: TCmDbField read FDtabrefundorf write SetDtabrefundorf;
       property Dtabrefundoimob: TCmDbField read FDtabrefundoimob write SetDtabrefundoimob;
       property Dtabrefundodic: TCmDbField read FDtabrefundodic write SetDtabrefundodic;
       property Dtabreep: TCmDbField read FDtabreep write SetDtabreep;
       property Dtabrebmf: TCmDbField read FDtabrebmf write SetDtabrebmf;
       property IdGrupoRegra: TCmDbField read FIdGrupoRegra write SetIdGrupoRegra;
       property IdTipoRegra: TCmDbField read FIdTipoRegra write SetIdTipoRegra;
       property FlgCotizaDataAnt : TCmDbField read FFlgCotizaDataAnt write SetFlgCotizaDataAnt;
       property FlgDiaUtil       : TCmDbField read FFlgDiaUtil       write SetFlgDiaUtil;
       property DtPrimeira       : TCmDbField read FDtPrimeira       write SetDtPrimeira;
       property VlrPrimeira      : TCmDbField read FVlrPrimeira      write SetVlrPrimeira;

       constructor Create(Aowner: TCmCustomCdbObject); override;

       function Insert : Boolean; override;
       function Update : Boolean; override;

   end;

implementation
{ TDbParamcota }

constructor TDbParamcota.Create(Aowner: TCmCustomCdbObject);
begin
     inherited;

     ErrorIfNoRowsAffected := False;

     TableName := 'PARAMCOTA';

     fIdempresaprop    := CreateCmDbField('IDEMPRESAPROP',    ftfloat,    True,  True,  False, True, '');

     fIdGrupoRegra     := CreateCmDbField('IDGRUPOREGRA',     ftfloat,    False, False, False, True, '');
     fIdTipoRegra      := CreateCmDbField('IDTIPOREGRA',      ftfloat,    False, False, False, True, '');

     fDtprimmanual     := CreateCmDbField('DTPRIMMANUAL',     ftDateTime, False, False, False, True, '', -1, True);
     fDtprimep         := CreateCmDbField('DTPRIMEP',         ftDateTime, False, False, False, True, '', -1, True);
     fDtprimimob       := CreateCmDbField('DTPRIMIMOB',       ftDateTime, False, False, False, True, '', -1, True);
     fDtprimrf         := CreateCmDbField('DTPRIMRF',         ftDateTime, False, False, False, True, '', -1, True);
     fDtprimrv         := CreateCmDbField('DTPRIMRV',         ftDateTime, False, False, False, True, '', -1, True);
     fDtprimbmf        := CreateCmDbField('DTPRIMBMF',        ftDateTime, False, False, False, True, '', -1, True);
     fDtprimfundorf    := CreateCmDbField('DTPRIMFUNDORF',    ftDateTime, False, False, False, True, '', -1, True);
     fDtprimfundorv    := CreateCmDbField('DTPRIMFUNDORV',    ftDateTime, False, False, False, True, '', -1, True);
     fDtprimfundoimob  := CreateCmDbField('DTPRIMFUNDOIMOB',  ftDateTime, False, False, False, True, '', -1, True);
     fDtprimfundodic   := CreateCmDbField('DTPRIMFUNDODIC',   ftDateTime, False, False, False, True, '', -1, True);

     fDtfechamanual    := CreateCmDbField('DTFECHAMANUAL',    ftDateTime, False, False, False, True, '', -1, True);
     fDtfechaep        := CreateCmDbField('DTFECHAEP',        ftDateTime, False, False, False, True, '', -1, True);
     fDtfechaimob      := CreateCmDbField('DTFECHAIMOB',      ftDateTime, False, False, False, True, '', -1, True);
     fDtfecharf        := CreateCmDbField('DTFECHARF',        ftDateTime, False, False, False, True, '', -1, True);
     fDtfecharv        := CreateCmDbField('DTFECHARV',        ftDateTime, False, False, False, True, '', -1, True);
     fDtfechabmf       := CreateCmDbField('DTFECHABMF',       ftDateTime, False, False, False, True, '', -1, True);
     fDtfechafundorf   := CreateCmDbField('DTFECHAFUNDORF',   ftDateTime, False, False, False, True, '', -1, True);
     fDtfechafundorv   := CreateCmDbField('DTFECHAFUNDORV',   ftDateTime, False, False, False, True, '', -1, True);
     fDtfechafundoimob := CreateCmDbField('DTFECHAFUNDOIMOB', ftDateTime, False, False, False, True, '', -1, True);
     fDtfechafundodic  := CreateCmDbField('DTFECHAFUNDODIC',  ftDateTime, False, False, False, True, '', -1, True);

     fDtabremanual     := CreateCmDbField('DTABREMANUAL',     ftDateTime, False, False, False, True, '', -1, True);
     fDtabreep         := CreateCmDbField('DTABREEP',         ftDateTime, False, False, False, True, '', -1, True);
     fDtabreimob       := CreateCmDbField('DTABREIMOB',       ftDateTime, False, False, False, True, '', -1, True);
     fDtabrerf         := CreateCmDbField('DTABRERF',         ftDateTime, False, False, False, True, '', -1, True);
     fDtabrerv         := CreateCmDbField('DTABRERV',         ftDateTime, False, False, False, True, '', -1, True);
     fDtabrebmf        := CreateCmDbField('DTABREBMF',        ftDateTime, False, False, False, True, '', -1, True);
     fDtabrefundorf    := CreateCmDbField('DTABREFUNDORF',    ftDateTime, False, False, False, True, '', -1, True);
     fDtabrefundorv    := CreateCmDbField('DTABREFUNDORV',    ftDateTime, False, False, False, True, '', -1, True);
     fDtabrefundoimob  := CreateCmDbField('DTABREFUNDOIMOB',  ftDateTime, False, False, False, True, '', -1, True);
     fDtabrefundodic   := CreateCmDbField('DTABREFUNDODIC',   ftDateTime, False, False, False, True, '', -1, True);

     FFlgCotizaDataAnt := CreateCmDbField('FLGCOTIZADATAANT', ftString,   False, False, False, True, '');
     FFlgDiaUtil       := CreateCmDbField('FLGDIAUTIL',       ftString,   False, False, False, True, '');
     FDtPrimeira       := CreateCmDbField('DTPRIMEIRA',       ftDateTime, False, False, False, True, '', -1, True);
     FVlrPrimeira      := CreateCmDbField('VLRPRIMEIRA',      ftFloat,    False, False, False, True, '');
end;

function TDbParamcota.Insert: Boolean;
begin
   Result := inherited Insert;
end;

procedure TDbParamcota.SetDtabrebmf(const Value: TCmDbField);
begin
   FDtabrebmf := Value;
end;

procedure TDbParamcota.SetDtabreep(const Value: TCmDbField);
begin
   FDtabreep := Value;
end;

procedure TDbParamcota.SetDtabrefundodic(const Value: TCmDbField);
begin
  FDtabrefundodic := Value;
end;

procedure TDbParamcota.SetDtabrefundoimob(const Value: TCmDbField);
begin
  FDtabrefundoimob := Value;
end;

procedure TDbParamcota.SetDtabrefundorf(const Value: TCmDbField);
begin
  FDtabrefundorf := Value;
end;

procedure TDbParamcota.SetDtabrefundorv(const Value: TCmDbField);
begin
  FDtabrefundorv := Value;
end;

procedure TDbParamcota.SetDtabreimob(const Value: TCmDbField);
begin
  FDtabreimob := Value;
end;

procedure TDbParamcota.SetDtabremanual(const Value: TCmDbField);
begin
  FDtabremanual := Value;
end;

procedure TDbParamcota.SetDtabrerf(const Value: TCmDbField);
begin
  FDtabrerf := Value;
end;

procedure TDbParamcota.SetDtabrerv(const Value: TCmDbField);
begin
  FDtabrerv := Value;
end;

procedure TDbParamcota.SetDtfechabmf(const Value: TCmDbField);
begin
  FDtfechabmf := Value;
end;

procedure TDbParamcota.SetDtfechaep(const Value: TCmDbField);
begin
  FDtfechaep := Value;
end;

procedure TDbParamcota.SetDtfechafundodic(const Value: TCmDbField);
begin
  FDtfechafundodic := Value;
end;

procedure TDbParamcota.SetDtfechafundoimob(const Value: TCmDbField);
begin
  FDtfechafundoimob := Value;
end;

procedure TDbParamcota.SetDtfechafundorf(const Value: TCmDbField);
begin
  FDtfechafundorf := Value;
end;

procedure TDbParamcota.SetDtfechafundorv(const Value: TCmDbField);
begin
  FDtfechafundorv := Value;
end;

procedure TDbParamcota.SetDtfechaimob(const Value: TCmDbField);
begin
  FDtfechaimob := Value;
end;

procedure TDbParamcota.SetDtfechamanual(const Value: TCmDbField);
begin
  FDtfechamanual := Value;
end;

procedure TDbParamcota.SetDtfecharf(const Value: TCmDbField);
begin
  FDtfecharf := Value;
end;

procedure TDbParamcota.SetDtfecharv(const Value: TCmDbField);
begin
  FDtfecharv := Value;
end;

procedure TDbParamcota.SetDtprimbmf(const Value: TCmDbField);
begin
  FDtprimbmf := Value;
end;

procedure TDbParamcota.SetDtPrimeira(const Value: TCmDbField);
begin
  FDtPrimeira := Value;
end;

procedure TDbParamcota.SetDtprimep(const Value: TCmDbField);
begin
  FDtprimep := Value;
end;

procedure TDbParamcota.SetDtprimfundodic(const Value: TCmDbField);
begin
  FDtprimfundodic := Value;
end;

procedure TDbParamcota.SetDtprimfundoimob(const Value: TCmDbField);
begin
  FDtprimfundoimob := Value;
end;

procedure TDbParamcota.SetDtprimfundorf(const Value: TCmDbField);
begin
  FDtprimfundorf := Value;
end;

procedure TDbParamcota.SetDtprimfundorv(const Value: TCmDbField);
begin
  FDtprimfundorv := Value;
end;

procedure TDbParamcota.SetDtprimimob(const Value: TCmDbField);
begin
  FDtprimimob := Value;
end;

procedure TDbParamcota.SetDtprimmanual(const Value: TCmDbField);
begin
  FDtprimmanual := Value;
end;

procedure TDbParamcota.SetDtprimrf(const Value: TCmDbField);
begin
  FDtprimrf := Value;
end;

procedure TDbParamcota.SetDtprimrv(const Value: TCmDbField);
begin
  FDtprimrv := Value;
end;

procedure TDbParamcota.SetFlgCotizaDataAnt(const Value: TCmDbField);
begin
  FFlgCotizaDataAnt := Value;
end;

procedure TDbParamcota.SetFlgDiaUtil(const Value: TCmDbField);
begin
  FFlgDiaUtil := Value;
end;

procedure TDbParamcota.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbParamcota.SetIdGrupoRegra(const Value: TCmDbField);
begin
   FIdGrupoRegra := Value;
end;

procedure TDbParamcota.SetIdTipoRegra(const Value: TCmDbField);
begin
   FIdTipoRegra := Value;
end;

procedure TDbParamcota.SetVlrPrimeira(const Value: TCmDbField);
begin
  FVlrPrimeira := Value;
end;

function TDbParamcota.Update: Boolean;
begin
   Result := inherited Update;
end;

end.
