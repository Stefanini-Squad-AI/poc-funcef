unit uCtrlListTerceiros;

interface

uses
   SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
   uCMTypes, uDbCotaMovim, uDbCotaCotacao, uDbCotaCalculo, uDbCota,
   DbClient, DB, uCtrlCota, uDiasUteis, uSistema,
   uTypesCota;

type
   TCtrlListTerceiros = class(TCMControlObject)
   private
      FCdsCotaCotacao: TCMClientDataSet;
      FDbCotaCotacao : TDbCotacotacao;
      FDbCotaCalculo : TDbCotaCalculo;
      FCdsCotaCalculo: TCMClientDataSet;
      FDbCota: TDbCota;
      CtrlCota: TCtrlCota;
      DiasUteis: TDiasUteis;

   protected

      procedure AfterInitialize; Override;
      procedure OnCreateAppServer; Override;

   public

      constructor Create;  override;
      destructor  Destroy; override;

      function ListaPlanoSPC : OleVariant; // Retorna query com lista de Planos SPC
      function AlimentaVarPlano(Const iPlano    : Integer = -1;
                                Const iPlanoSPC : Integer = -1) : String; // Retorna IDPLANOPREV referênte ao Plano SPC informado, ou o próprio IDPLANOPREV


   published

   end;

implementation
{ TCtrlListTerceiros }

procedure TCtrlListTerceiros.AfterInitialize;
begin
   inherited;

   FDbCotaCalculo.DataBaseName   := DataBaseName;
   FDbCotaCotacao.DataBaseName   := DataBaseName;
   FDbCota.DataBaseName          := DataBaseName;

   CtrlCota.InitializeAs(self);
   DiasUteis.InitializeAs(self);
end;


constructor TCtrlListTerceiros.Create;
begin
  inherited;

  FDbCotaCalculo := TDbCotaCalculo.Create(Self);
  FDbCotaCotacao := TDbCotaCotacao.Create(Self);
  FDbCota        := TDbCota.Create(Self);
  CtrlCota       := TCtrlCota.Create;
  DiasUteis      := TDiasUteis.Create;
end;

destructor TCtrlListTerceiros.Destroy;
begin
  FreeAndNil(FDbCotaCalculo);
  FreeAndNil(FDbCotaCotacao);
  FreeAndNil(FDbCota);
  FreeAndNil(CtrlCota);
  FreeAndNil(DiasUteis);

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then
  begin
     FreeAndNil(FCdsCotaCotacao);
     FreeAndNil(FCdsCotaCalculo);
  end;

  inherited;
end;

procedure TCtrlListTerceiros.OnCreateAppServer;
begin
  inherited;

  FCdsCotaCotacao := TCMClientDataSet.Create(Nil);
  FCdsCotaCalculo := TCMClientDataSet.Create(Nil);
end;

function TCtrlListTerceiros.ListaPlanoSPC : OleVariant;
var
   sSQL : String;

begin
   sSQL := 'SELECT IDPLANOPREV,           ' + #13 +
           '       NOME AS NOMEPLANO      ' + #13 +
           '  FROM PLANPREV               ' + #13 +
           '                              ' + #13 +
           'UNION                         ' + #13 +
           '                              ' + #13 +
           'SELECT IDPLANOPREV,           ' + #13 +
           '       NOME AS NOMEPLANO      ' + #13 +
           '  FROM PLANPREVCONTABIL       ' + #13 +
           ' WHERE IDPLANOPREVPREV IS NULL' + #13 +
           '                              ' + #13 +
           'ORDER BY NOMEPLANO            ';

   Result := GetDataPacket(sSQL);
end;

function TCtrlListTerceiros.AlimentaVarPlano(Const iPlano    : Integer;
                                             Const iPlanoSPC : Integer) : String;
var
   cdsPlanPrevContabil : TCMClientDataSet;
   sPlanos             : String;
   sSQL                : String;

begin
   if ((iPlano = -1) and (iPlanoSPC = -1)) then
   begin
      Result := '';
      Exit;
   end;

   if iPlano > 0 then
   begin
      Result := IntToStr(iPlano);
      Exit;
   end;

   if iPlanoSPC > 0 then
   begin
      cdsPlanPrevContabil := TCMClientDataSet.Create(nil);

      sSQL := 'SELECT IDPLANOPREV       ' + #13 +
              '  FROM PLANPREVCONTABIL  ' + #13 +
              ' WHERE IDPLANOPREVPREV = ' + IntToStr(iPlanoSPC);

      cdsPlanPrevContabil.Data := GetDataPacket(sSQL);

      sPlanos := '';

      if cdsPlanPrevContabil.Eof then
      begin
         sPlanos := IntToStr(iPlanoSPC);
      end
      else
      begin
         while not cdsPlanPrevContabil.Eof do
         begin
            sPlanos := sPlanos + cdsPlanPrevContabil.FieldByName('IDPLANOPREV').AsString + ',';

            cdsPlanPrevContabil.Next;
         end;

         sPlanos := Copy(sPlanos,1,(Length(sPlanos) - 1));
      end;

      Result := sPlanos;
      FreeAndNil (cdsPlanPrevContabil);
   end;
end;

end.
