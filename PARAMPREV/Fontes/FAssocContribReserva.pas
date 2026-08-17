// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      :
// Autor(a)    : Leo
// Data        : 24/04/2003
// Alteração   : correção na leitura do parâmetro da regra de valor máximo de rateio
// -----------------------------------------------------------------------------

unit FAssocContribReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, DBGrids, Buttons, StdCtrls, wwdblook, ExtCtrls,
  MAHlpBtn, Db, DBTables, Wwquery, Wwdbigrd, Wwdbgrid, Wwdatsrc,
  cmseldlg, ComCtrls, CMTree, TB97, Menus, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti;

type
  TfrmAssocContribReserva = class(TfrmOkCancelar)
    seldlgProcura: TcmSelectDlg;
    dsArvore: TwwDataSource;
    qryArvore: TwwQuery;
    qryArvoreIDTIPORESERVA: TFloatField;
    qryArvoreIDPLANOPREV: TFloatField;
    qryArvoreNOME: TStringField;
    qryArvoreANALITICOSINTETI: TStringField;
    qryArvoreCODHIERARQUIA: TStringField;
    qryArvoreFLGCONTROLE: TFloatField;
    qryContrib: TwwQuery;
    qryReservaXContrib: TwwQuery;
    dsReservaXContrib: TwwDataSource;
    panel2: TPanel;
    label1: TLabel;
    dblkpcmbContrib: TwwDBLookupCombo;
    dbgReservaXContrib: TwwDBGrid;
    cmtvTipoReserva: TCMTreeView;
    sbtnAssocia: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    Panel1: TPanel;
    lblTitulo: TLabel;
    pmenu: TPopupMenu;
    mnuAlterar: TMenuItem;
    qryAux: TwwQuery;
    qryReservaXContribIDTIPORESERVA: TFloatField;
    qryReservaXContribIDPLANOPREV: TFloatField;
    qryReservaXContribIDCONTRIBUICAO: TFloatField;
    qryReservaXContribIDREGRACALCULORE: TFloatField;
    qryReservaXContribPERCENTUAL: TFloatField;
    qryReservaXContribNOMEREGRA: TStringField;
    qryReservaXContribNOME: TStringField;
    qryReservaXContribANOMESREFRATEIO: TStringField;
    qryReservaXContribVALORMAXIMORATEIO: TFloatField;
    qryReservaXContribIDRGVLRMAXRATEIO: TFloatField;
    qryReservaXContribNOMEREGRARATEIO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbContribCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure dblkpcmbContribEnter(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaDbGrid;
    function TestaPercentualValido: Boolean;
  public
    { Public declarations }
  end;

var
  frmAssocContribReserva: TfrmAssocContribReserva;
  bCarregaDbGrid: boolean;

implementation

uses
  UMensErro, UAdmPrev, USistema, FLerRegraContribReserva;

{$R *.DFM}

procedure TfrmAssocContribReserva.FormShow(Sender: TObject);
begin
  inherited;
  lblTitulo.Caption := ' Reservas do Plano: ' + sNomePlano;

  qryContrib.Close;
  qryContrib.ParamByName('pIdPlanoPrev').AsString := sIdPlano;
  qryContrib.Open;

  qryReservaXContrib.Close;



  cmtvTipoReserva.Mascara  := sMascTpReserva;

  bCarregaDbGrid := False;

  qryArvore.Close;
  qryArvore.SQL.Clear;
  qryArvore.SQL.Add(' SELECT IDPLANOPREV, IDTIPORESERVA, INDICEREAJUSTE,  '+
                    '        IDREGRAPAGTORESE, NOME, ANALITICOSINTETI,    '+
                    '        CODHIERARQUIA, FLGCOLETIVA,                  '+
                    '        FLGCONTROLE,FLGDESCIRRF, FLGTITULARCOLET     '+
                    ' FROM  ' + Sistema.PrefixoServidor + 'RESERVAXPLANO  '+
                    ' WHERE IDPLANOPREV = ' + sIdPlano +
                    ' ORDER BY CODHIERARQUIA ');
  qryArvore.Open;

  cmtvTipoReserva.MontaArvore;
 {Somente carrega a DbGrid depois que monta a arvore}
  bCarregaDbGrid := True;

  if qryArvore.IsEmpty then
     cmtvTipoReserva.Enabled := False
  else
     begin
          cmtvTipoReserva.Enabled := True;
          cmtvTipoReserva.SetFocus;
     end;
end;

procedure TfrmAssocContribReserva.dblkpcmbContribCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  AtualizaDbGrid;
end;

procedure TfrmAssocContribReserva.dblkpcmbContribEnter(Sender: TObject);
begin
  inherited;

  if dblkpcmbContrib.Text = '' then
     exit;

  
  if not TestaPercentualValido then 
     begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' DELETE FROM RESERVAXCONTRIB ' +
                         ' WHERE IDPLANOPREV    = ' + sIdPlano + ' AND ' +
                         '       IDTIPORESERVA  = ' + qryReservaXContrib.FieldByName('IDTIPORESERVA').AsString + ' AND ' +
                         '       IDCONTRIBUICAO = ' + qryContrib.FieldByName('IDCONTRIBUICAO').AsString);
          try
             qryAux.ExecSQL;
          except
             on E: EDBEngineError do
                begin
                     MostrarErro(E);
                     Exit;
                end;
          end;

          AtualizaDbGrid;
     end;
end;

function TfrmAssocContribReserva.TestaPercentualValido: boolean;
begin
  Result := False;

  {Verificar Percentual}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT SUM(RC.PERCENTUAL) AS PERCENTUAL, RC.IDCONTRIBUICAO ' +
                 ' FROM RESERVAXCONTRIB RC, RESERVAXPLANO RP ' +
                 ' WHERE RC.IDPLANOPREV    = ' + sIdPlano + ' AND ' +
                 '       RC.IDCONTRIBUICAO = ' + qryContrib.FieldByName('IDCONTRIBUICAO').AsString + ' AND ' +
                 '       RC.IDPLANOPREV   = RP.IDPLANOPREV AND ' +
                 '       RC.IDTIPORESERVA = RP.IDTIPORESERVA AND ' +
                 '       RP.FLGCONTROLE = 0 ' +
                 ' GROUP BY RC.IDCONTRIBUICAO ');
  qryAux.Open;
  

  Result := True;
 
end;

procedure TfrmAssocContribReserva.sbtnAssociaClick(Sender: TObject);
var
  varfields : variant;
  sSQL ,
  sPercentual : string;
  iIdRegra, iIdRegraValorMaxRateio    : longint;
  dPercentualJaCad : double;
begin
  inherited;
  if Trim(dblkpcmbContrib.Text) = '' then
     begin
          MsgDlg('A Contribuição deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbContrib.SetFocus;
          Exit;
     end;

  if qryArvore.FieldByName('ANALITICOSINTETI').AsString = 'S' then
     begin
          MsgDlg('Esta Reserva é Sintética!','Informação',mtInformation,[mbOk,mbHelp],0);
          cmtvTipoReserva.SetFocus;
          Exit;
     end;

  {Verifica se o registro ja existe}
  if not qryReservaXContrib.IsEmpty
  then begin
     varFields := VarArrayCreate([0,2],varVariant);
     varFields[0] := sIdPlano;
     varFields[1] := qryContrib.FieldByName('IDCONTRIBUICAO').AsString;
     varFields[2] := qryArvore.FieldByName('IDTIPORESERVA').AsString;

     if qryReservaXContrib.Locate('IDPLANOPREV;IDCONTRIBUICAO;IDTIPORESERVA',varFields,[loCaseInsensitive, loPartialKey]) then
     begin
        MsgDlg('Esta Reserva já está cadastrada nesta Contribuição.','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;
  end;

  sPercentual := '';
  iIdRegra    := -1;
  iIdRegraValorMaxRateio := -1;

  if not LerRegraContribReserva( sNomePlano,
                                 qryArvore.FieldByName('NOME').AsString,
                                 qryContrib.FieldByName('NOME').AsString,
                                 sPercentual, iIdRegra, iIdRegraValorMaxRateio)
  then begin
     Exit;
  end;

  dPercentualJaCad := 0;
  if (Trim(sPercentual) <> '') and (qryArvore.FieldByName('FlgControle').AsInteger = 0)
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT SUM(RC.PERCENTUAL) AS TOTAL '+
                    ' FROM   RESERVAXPLANO RP, RESERVAXCONTRIB RC'+
                    ' WHERE  RC.IDPLANOPREV    = '+sIdPlano+
                    ' AND    RC.IDCONTRIBUICAO = '+IntToStr(qryContrib.FieldByName('IDCONTRIBUICAO').AsInteger)+
                    ' AND    RC.IDTIPORESERVA  <> '+IntToStr(qryArvore.FieldByName('IDTIPORESERVA').AsInteger)+
                    ' AND    RP.FLGCONTROLE    = 0 '+
                    ' AND    RP.IDPLANOPREV    = RC.IDPLANOPREV '+
                    ' AND    RP.IDTIPORESERVA  = RC.IDTIPORESERVA ');
     qryAux.Open;
     if (not qryAux.IsEmpty) and (qryAux.FieldByName('Total').AsFloat > 0)
     then dPercentualJaCad := qryAux.FieldByName('Total').AsFloat;
     qryAux.Close;

     dPercentualJaCad := dPercentualJaCad + StrToFloat(ClienteNumero(sPercentual));

     if dPercentualJaCad > 100
     then begin
        MsgDlg('Uma mesma contribuição não pode ter mais de 100% de seu valor associado a reservas. Verifique.',
               'Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;
  end;

  sSQL := sIdPlano;
  if Trim(sPercentual) <> '' then
    sSQL := sSQL + ', '+ OraNumero(sPercentual)
  else sSQL := sSQL +', NULL';

  sSQL := sSQL + ', '+ IntToStr(qryContrib.FieldByName('IDCONTRIBUICAO').AsInteger);
  sSQL := sSQL + ', '+ IntToStr(qryArvore.FieldByName('IDTIPORESERVA').AsInteger);

  if iIdRegra > 0 then
    sSQL := sSQL + ', '+ IntToStr(iIdRegra)
  else sSQL := sSQL +', NULL';

  if iIdRegraValorMaxRateio > 0
  then sSQL := sSQL + ', '+ IntToStr(iIdRegraValorMaxRateio)
  else sSQL := sSQL +', NULL';

  //Alteraçao no campo IDRGVALORMAXRATEIO para IDRGVLRMAXRATEIO
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' INSERT INTO RESERVAXCONTRIB(IDPLANOPREV, PERCENTUAL, IDCONTRIBUICAO, ' +
                 '                             IDTIPORESERVA, IDREGRACALCULORE, IDRGVLRMAXRATEIO) ' +
                 ' VALUES(' + sSQL + ')');
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  // Guarda Chave
  varFields := VarArrayCreate([0,2],varVariant);
  varFields[0] := sIdPlano;
  varFields[1] := qryContrib.FieldByName('IDCONTRIBUICAO').AsString;
  varFields[2] := qryArvore.FieldByName('IDTIPORESERVA').AsString;

  AtualizaDbGrid;

  {Para posicinar no registro que estava}
  qryReservaXContrib.Locate('IDPLANOPREV;IDCONTRIBUICAO;IDTIPORESERVA',varFields,[loCaseInsensitive, loPartialKey]);

    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption+ ' - Associando Contribuição') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
  
end;

procedure TfrmAssocContribReserva.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;
  if Trim(dblkpcmbContrib.Text) = '' then
     begin
          MsgDlg('A Contribuição deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbContrib.SetFocus;
          Exit;
     end;

  if qryReservaXContrib.FieldByName('IDTIPORESERVA').AsString = '' then
     begin
          MsgDlg('Primeiro selecione a Reserva.','Erro',mtError,[mbOk,mbHelp],0);
          dbgReservaXContrib.SetFocus;
          Exit;
     end;


 {Deleta}
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM RESERVAXCONTRIB ' +
                 ' WHERE IDPLANOPREV    = ' + sIdPlano + ' AND ' +
                 '       IDTIPORESERVA  = ' + qryReservaXContrib.FieldByName('IDTIPORESERVA').AsString + ' AND ' +
                 '       IDCONTRIBUICAO = ' + qryContrib.FieldByName('IDCONTRIBUICAO').AsString);
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do
        begin
             MostrarErro(E);
             Exit;
        end;
  end;

  AtualizaDbGrid;

    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption+ ' - Desassociando Contribuição') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmAssocContribReserva.mnuAlterarClick(Sender: TObject);
var
  varfields : variant;
  iIdRegra, iIdRegraValorMaxRateio  : longint;
  sSQL,
  sPercentual : string;
begin
  inherited;
  if Trim(dblkpcmbContrib.Text) = ''
  then begin
     MsgDlg('A Contribuição deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbContrib.SetFocus;
     Exit;
  end;

  if qryReservaXContrib.FieldByName('IDTIPORESERVA').AsString = ''
  then begin
     MsgDlg('Primeiro selecione a Reserva.','Erro',mtError,[mbOk,mbHelp],0);
     dbgReservaXContrib.SetFocus;
     Exit;
  end;

  iIdRegra               := qryReservaXContrib.FieldByName('IDREGRACALCULORE').AsInteger;
  iIdRegraValorMaxRateio := qryReservaXContrib.FieldByName('IDRGVLRMAXRATEIO').AsInteger;
  sPercentual            := qryReservaXContrib.FieldByName('PERCENTUAL').AsString;

  if not LerRegraContribReserva( sNomePlano,
                                 qryArvore.FieldByName('NOME').AsString,
                                 qryContrib.FieldByName('NOME').AsString,
                                 sPercentual, iIdRegra, iIdRegraValorMaxRateio)
  then begin
     Exit;
  end;

  sSQL := ' PERCENTUAL = ' + OraNUmero(sPercentual);
  
  if iIdRegra > 0
  then sSQL := sSQL +', IDREGRACALCULORE = '+IntToStr(iIdRegra)
  else sSQL := sSQL +', IDREGRACALCULORE = NULL ';

  if iIdRegraValorMaxRateio > 0
  then sSQL := sSQL +', IDRGVLRMAXRATEIO = '+IntToStr(iIdRegraValorMaxRateio)
  else sSQL := sSQL +', IDRGVLRMAXRATEIO = NULL ';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE RESERVAXCONTRIB SET '+sSQL+
                 ' WHERE IDPLANOPREV    = ' + sIdPlano + ' AND ' +
                 '       IDTIPORESERVA  = ' + qryReservaXContrib.FieldByName('IDTIPORESERVA').AsString + ' AND ' +
                 '       IDCONTRIBUICAO = ' + qryContrib.FieldByName('IDCONTRIBUICAO').AsString);
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  // Guarda Chave
  varFields := VarArrayCreate([0,2],varVariant);
  varFields[0] := sIdPlano;
  varFields[1] := qryContrib.FieldByName('IDCONTRIBUICAO').AsString;
  varFields[2] := qryReservaXContrib.FieldByName('IDTIPORESERVA').AsString;

  AtualizaDbGrid;

  // Para posicinar no registro que estava
  qryReservaXContrib.Locate('IDPLANOPREV;IDCONTRIBUICAO;IDTIPORESERVA',varFields,[loCaseInsensitive, loPartialKey]);
end;

procedure TfrmAssocContribReserva.AtualizaDbGrid;
begin
  qryReservaXContrib.Close;
  qryReservaXContrib.ParamByName('pIdPlanoPrev').AsString    := sIdPlano;
  qryReservaXContrib.ParamByName('pIdContribuicao').AsString := qryContrib.FieldByName('IDCONTRIBUICAO').AsString;
  qryReservaXContrib.Open;
end;

end.



