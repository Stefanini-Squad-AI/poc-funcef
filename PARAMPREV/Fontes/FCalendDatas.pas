// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : dtCobNormalEnter, dtCobNormalExit
// Autor(a)    : Gleyber
// Data        : 06/01/2003
// Alteração   : Mudança na rotina atribuicao a variavel lógica bAlterou.
// -----------------------------------------------------------------------------
unit FCalendDatas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, wwdblook, Spin, ComCtrls, Tabs, Grids, IvDictio,
  IvMulti, IvEMulti, Calendar, Wwdatsrc, Mask, wwdbedit,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCalendDatas = class(TfrmOkCancelar)
    pnlTopo: TPanel;
    dblkpcmbCalend: TwwDBLookupCombo;
    qryCalendario: TwwQuery;
    pnlBottom: TPanel;
    tsSituacao: TTabSet;
    qryCalendDatas: TwwQuery;
    qryCalendarioIDCALENDARIO: TFloatField;
    qryCalendarioNOME: TStringField;
    qryUpdCalendDatas: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    grpMesInicio: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    Label1: TLabel;
    gbCobranca: TGroupBox;
    Label2: TLabel;
    gbBeneficio: TGroupBox;
    Label3: TLabel;
    dtCobNormal: TCMDateTimePicker;
    Label4: TLabel;
    dtCobAtraso: TCMDateTimePicker;
    Label5: TLabel;
    dtCobDevolucao: TCMDateTimePicker;
    Label6: TLabel;
    dtPagBenef: TCMDateTimePicker;
    Label7: TLabel;
    dtPagAntBenef: TCMDateTimePicker;
    Label8: TLabel;
    dtPagAbono: TCMDateTimePicker;
    dtPagAntAbono: TCMDateTimePicker;
    Label9: TLabel;
    qryCalendDatasIDCALENDARIO: TFloatField;
    qryCalendDatasFLGINTERNO: TStringField;
    qryCalendDatasANOMESREF: TStringField;
    qryCalendDatasDATACOBNORMAL: TDateTimeField;
    qryCalendDatasDATACOBATRASO: TDateTimeField;
    qryCalendDatasDATACOBDEVOLUCAO: TDateTimeField;
    qryCalendDatasDATAPAGBENEF: TDateTimeField;
    qryCalendDatasDATAPAGABONO: TDateTimeField;
    qryCalendDatasDATAPAGANTBENEF: TDateTimeField;
    qryCalendDatasDATAPAGANTABONO: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure cmbMesRefChange(Sender: TObject);
    procedure spedAnoRefChange(Sender: TObject);
    procedure tsSituacaoChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure tsSituacaoClick(Sender: TObject);
    procedure dblkpcmbCalendChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblkpcmbCalendEnter(Sender: TObject);
    procedure cmbMesRefEnter(Sender: TObject);
    procedure spedAnoRefEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtCobNormalEnter(Sender: TObject);
    procedure dtCobDevolucaoEnter(Sender: TObject);
    procedure dtCobAtrasoEnter(Sender: TObject);
    procedure dtPagBenefEnter(Sender: TObject);
    procedure dtPagAbonoEnter(Sender: TObject);
    procedure dtPagAntBenefEnter(Sender: TObject);
    procedure dtPagAntAbonoEnter(Sender: TObject);
    procedure dblkpcmbCalendExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtCobNormalExit(Sender: TObject);
  private
    { Private declarations }
    sMes, sAno, sAnoMes, sUltAnoMes : string;
    bAlterou : boolean;
    liUltCalendario : LongInt;
    sVarData : String;   
    procedure GravaDatas(pIdCalendario : integer;pAnoMes : string);
    procedure PreencheGrid;
    procedure LimpaGrid;

  public
    { Public declarations }
  end;

const
  VetSit : array[0..4] of string[2] = ('AT','MA','MP','AS','PT');

var
  frmCalendDatas: TfrmCalendDatas;

implementation

uses UFuncoesUteis,UMensErro,DBaseDados, usistema;

{$R *.DFM}

procedure TfrmCalendDatas.FormCreate(Sender: TObject);
var
  AYear, AMonth, ADay : Word;
begin
  inherited;
  ShortDateFormat := 'dd/MM/yyyy';
  bAlterou := False;
  liUltCalendario := 0;
  sUltAnoMes := '';
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
         cmbMesRef.ItemIndex := AMonth - 1;
         cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
       end;
  tsSituacao.TabIndex := 0;
  spedAnoRef.Text   := IntToStr(AYear);
  dblkpcmbCalend.Text := '';
  LimpaGrid;
  qryCalendario.Close;
  qryCalendario.Open;
  dtmBaseDados.dbBaseDados.StartTransaction;
end; 

procedure TfrmCalendDatas.LimpaGrid;
begin
  // Preencher variaveis de Mes de Referencia
  // O mes de cobranca será calculado de acordo com o plano
  sAno := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMes := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMes := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMes := sAno+'/'+sMes;

  dtCobNormal.Text    := '';
  dtCobAtraso.Text    := '';
  dtCobDevolucao.Text := '';
  dtPagBenef.Text     := '';
  dtPagAntBenef.Text  := '';
  dtPagAbono.Text     := '';
  dtPagAntAbono.Text  := '';

end; 

procedure TfrmCalendDatas.PreencheGrid;
var iLin, iCol : integer;
begin
   if trim(dblkpcmbcalend.text) = ''
   then begin
      LimpaGrid;
      Exit;
   end;
   qryCalendDatas.Close;
   qryCalendDatas.ParamByName('IdCalendario').Value := qryCalendario.FieldByName('IdCalendario').AsInteger;
   qryCalendDatas.ParamByName('AnoMesRef').Value := sAnoMes;
   qryCalendDatas.ParamByName('FlgInterno').Value := VetSit[tsSituacao.TabIndex];
   qryCalendDatas.Open;
   if qryCalendDatas.IsEmpty
   then begin
          qryCalendDatas.Close;
          LimpaGrid;
          Exit;
       end;
   dtCobNormal.Text     := qryCalendDatas.FieldByName('DataCobNormal').AsString;
   dtCobAtraso.Text     := qryCalendDatas.FieldByName('DataCobAtraso').AsString;
   dtCobDevolucao.Text  := qryCalendDatas.FieldByName('DataCobDevolucao').AsString;
   dtPagBenef.Text      := qryCalendDatas.FieldByName('DataPagBenef').AsString;
   dtPagAntBenef.Text   := qryCalendDatas.FieldByName('DataPagAntBenef').AsString;
   dtPagAbono.Text      := qryCalendDatas.FieldByName('DataPagAbono').AsString;
   dtPagAntAbono.Text   := qryCalendDatas.FieldByName('DataPagAntAbono').AsString;
end; 

procedure TfrmCalendDatas.cmbMesRefChange(Sender: TObject);
begin
  inherited;
// Caso Tenha Alterado
  sUltAnoMes := sAnoMes;
  sAno := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMes := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMes := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMes := sAno+'/'+sMes;
  if bAlterou
  then begin
         GravaDatas(qryCalendario.FieldByName('IdCalendario').AsInteger,sUltAnoMes);
         bAlterou := False;
       end;
  PreencheGrid;
end; 

procedure TfrmCalendDatas.spedAnoRefChange(Sender: TObject);
begin
  inherited;
  sUltAnoMes := sAnoMes;
  sAno := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMes := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMes := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMes := sAno+'/'+sMes;
// Caso Tenha Alterado
  if bAlterou
  then begin
         GravaDatas(qryCalendario.FieldByName('IdCalendario').AsInteger,sUltAnoMes);
         bAlterou := False;
       end;
  PreencheGrid;
end; 

procedure TfrmCalendDatas.tsSituacaoChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  inherited;
// Caso Tenha Alterado
  if bAlterou
  then begin
         GravaDatas(qryCalendario.FieldByName('IdCalendario').AsInteger,sAnoMes);
         bAlterou := False;
       end;
  PreencheGrid;

  if VetSit[NewTab] <> 'AS'
  then gbBeneficio.Visible := False
  else gbBeneficio.Visible := True;
end; 

procedure TfrmCalendDatas.tsSituacaoClick(Sender: TObject);
begin
  inherited;
  PreencheGrid;
end;

procedure TfrmCalendDatas.dblkpcmbCalendChange(Sender: TObject);
begin
  inherited;
// Caso Tenha Alterado
  if bAlterou
  then begin
         GravaDatas(liUltCalendario,sAnoMes);
         bAlterou := False;
       end;
  PreencheGrid;
end; 

procedure TfrmCalendDatas.GravaDatas(pIdCalendario : integer;pAnoMes : string);
begin
  with qryUpdCalendDatas do
  begin
    // Chave
    Close;
    ParamByName('IdCalendario').Value := pIdCalendario;
    ParamByName('FlgInterno').Value := VetSit[tsSituacao.TabIndex];
    ParamByName('AnoMesRef').Value := pAnoMes;

    // Normal
    if Trim(dtCobNormal.Text) <> ''
    then ParamByName('DataCobNormal').Value := StrToDateTime(dtCobNormal.Text)
    else ParamByName('DataCobNormal').Clear;
    // Atrasada
    if Trim(dtCobAtraso.Text) <> ''
    then ParamByName('DataCobAtraso').Value := StrToDateTime(dtCobAtraso.Text)
    else ParamByName('DataCobAtraso').Clear;
    // Devolução
    if Trim(dtCobDevolucao.Text) <> ''
    then ParamByName('DataCobDevolucao').Value := StrToDateTime(dtCobDevolucao.Text)
    else ParamByName('DataCobDevolucao').Clear;
    // Beneficio
    if Trim(dtPagBenef.Text) <> ''
    then ParamByName('DataPagBenef').Value := StrToDateTime(dtPagBenef.Text)
    else ParamByName('DataPagBenef').Clear;
    // Antecipação de Beneficio
    if Trim(dtPagAntBenef.Text) <> ''
    then ParamByName('DataPagAntBenef').Value := StrToDateTime(dtPagAntBenef.Text)
    else ParamByName('DataPagAntBenef').Clear;
    // Abono
    if Trim(dtPagAbono.Text) <> ''
    then ParamByName('DataPagAbono').Value := StrToDateTime(dtPagAbono.Text)
    else ParamByName('DataPagAbono').Clear;
    // Antecipação de Abono
    if Trim(dtPagAntAbono.Text) <> ''
    then ParamByName('DataPagAntAbono').Value := StrToDateTime(dtPagAntAbono.Text)
    else ParamByName('DataPagAntAbono').Clear;

    ExecSQL;
  end;
end; 

procedure TfrmCalendDatas.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if bAlterou
  then begin
         GravaDatas(liUltCalendario,sAnoMes);
         bAlterou := False;
       end;


    
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

  dtmBaseDados.dbBaseDados.Commit;
  dtmBaseDados.dbBaseDados.StartTransaction;
  PreencheGrid;
end; 

procedure TfrmCalendDatas.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Rollback;
end; 

procedure TfrmCalendDatas.dblkpcmbCalendEnter(Sender: TObject);
begin
  inherited;
  liUltCalendario := qryCalendario.FieldByName('IdCalendario').AsInteger;
end; 



procedure TfrmCalendDatas.dblkpcmbCalendExit(Sender: TObject);
begin
  inherited;
  liUltCalendario := qryCalendario.FieldByName('IdCalendario').AsInteger;
end;

procedure TfrmCalendDatas.cmbMesRefEnter(Sender: TObject);
begin
  inherited;
  sUltAnoMes := sAnoMes;
end; 

procedure TfrmCalendDatas.spedAnoRefEnter(Sender: TObject);
begin
  inherited;
  sUltAnoMes := sAnoMes;
end; 

procedure TfrmCalendDatas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCalendario.Close;
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Rollback;
end; 

procedure TfrmCalendDatas.dtCobNormalEnter(Sender: TObject);
begin
  inherited;
  sVarData := DateToStr(TCMDateTimePicker(Sender).Date);

end; 

procedure TfrmCalendDatas.dtCobNormalExit(Sender: TObject);
begin
  inherited;
  If (Not bAlterou) And (DateToStr(TCMDateTimePicker(Sender).Date) <> sVarData)
   Then bAlterou := True;
end;

procedure TfrmCalendDatas.dtCobDevolucaoEnter(Sender: TObject);
begin
  inherited;
  bAlterou := True;
end; 

procedure TfrmCalendDatas.dtCobAtrasoEnter(Sender: TObject);
begin
  inherited;
  bAlterou := True;
end; 

procedure TfrmCalendDatas.dtPagBenefEnter(Sender: TObject);
begin
  inherited;
  bAlterou := True;
end; 

procedure TfrmCalendDatas.dtPagAbonoEnter(Sender: TObject);
begin
  inherited;
  bAlterou := True;
end; 

procedure TfrmCalendDatas.dtPagAntBenefEnter(Sender: TObject);
begin
  inherited;
  bAlterou := True;
end; 

procedure TfrmCalendDatas.dtPagAntAbonoEnter(Sender: TObject);
begin
  inherited;
  bAlterou := True;
end; 


procedure TfrmCalendDatas.FormShow(Sender: TObject);
begin
  inherited;
  sVarData := '';  
end;


end.

