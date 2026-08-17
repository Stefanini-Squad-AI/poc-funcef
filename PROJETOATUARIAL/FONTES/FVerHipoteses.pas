{===============================================================================
Unit    :  FVerHipotese
Form    :  frmVerHipotses

Autor   : Claudio Faria
Empresa : CM Soluões

Data    : 08/06/2006

Objetivo: Alterar os valores das premicas de um cálculo atuarial
          CM nº 21489

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}

unit FVerHipoteses;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, Grids, DBGrids, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, DBClient,
  uMensErro;

type
  TFrmVerHipoteses = class(TfrmOkCancelar)
    dbgHipoteses: TDBGrid;
    wwQryHipoteses: TwwQuery;
    dsHipoteses: TDataSource;
    cdsHipotese: TClientDataSet;
    qryHipotese: TwwQuery;
    qryHipoteseDS_HIPOTESE: TStringField;
    qryHipoteseDT_GERACAO: TDateTimeField;
    qryHipoteseCD_HIPOTESE: TFloatField;
    qryHipoteseNR_IDADE_MIN_TB_SERV: TFloatField;
    qryHipoteseNR_IDADE_MAX_TB_SERV: TFloatField;
    qryHipoteseIDREGRA: TFloatField;
    qryComposicao_Hipotese: TwwQuery;
    qryComposicao_HipoteseDS_ITEM_HIPOTESE: TStringField;
    qryComposicao_HipoteseDS_VERSAO_COMUTACAO_MAS: TStringField;
    qryComposicao_HipoteseDS_VERSAO_COMUTACAO_FEM: TStringField;
    qryComposicao_HipoteseDS_VERSAO_COMUTACAO_PEN: TStringField;
    qryComposicao_HipoteseVL_HIPOTESE: TFloatField;
    qryComposicao_HipoteseCD_HIPOTESE: TFloatField;
    qryComposicao_HipoteseCD_ITEM_HIPOTESE: TFloatField;
    qryComposicao_HipoteseIR_GERA_TAB_SERVICO: TStringField;
    qryComposicao_HipoteseSQ_VERSAO_COMUTACAO_MAS: TFloatField;
    qryComposicao_HipoteseSQ_VERSAO_COMUTACAO_FEM: TFloatField;
    qryComposicao_HipoteseSQ_VERSAO_COMUTACAO_PEN: TFloatField;
    qryComposicao_HipoteseIR_ITEM_HIPOTESE: TStringField;
    qryAux: TwwQuery;
    qryItemAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure cdsHipoteseBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vHipotese:Integer;
  end;

var
  FrmVerHipoteses: TFrmVerHipoteses;
  vAlteracao:Boolean;

implementation

uses UCalculoAtuarial, dBaseDados, FSimulacaoCalcAtuarial;

{$R *.DFM}

procedure TFrmVerHipoteses.FormCreate(Sender: TObject);
Var N:Integer;
begin
   inherited;

   cdsHipotese.Close;
   cdsHipotese.FieldDefs.Clear;

   wwQryHipoteses.Close;
   wwQryHipoteses.ParamByName('CD_HIPOTESE').AsInteger :=
          FrmSimulacaoCalcAtuarial.qryHipotese.FieldByName('CD_HIPOTESE').AsInteger;
   wwQryHipoteses.Open;

   { Passa para um cds as premicas originas }
   For N:=0 to wwQryHipoteses.FieldCount -1 do
      cdsHipotese.FieldDefs.Add(wwQryHipoteses.Fields[N].FieldName,
                                wwQryHipoteses.Fields[N].DataType,
                                wwQryHipoteses.Fields[N].Size,
                                False);

   wwQryHipoteses.First;
   cdsHipotese.CreateDataSet;

   { Passa os valores das premicas originais }
   While Not wwQryHipoteses.EOF do
   Begin
      cdsHipotese.Insert;

      For N:=1 to wwQryHipoteses.FieldCount -1 do
         cdsHipotese.FieldByName(wwQryHipoteses.Fields[N].FieldName).Value :=
                                             wwQryHipoteses.Fields[N].Value;
      cdsHipotese.Post;

      wwQryHipoteses.Next;
   End;

   wwQryHipoteses.Close;
   vAlteracao := False;
end;

procedure TFrmVerHipoteses.cdsHipoteseBeforePost(DataSet: TDataSet);
begin
   inherited;

   { Verifica se houve alteração dos valores das premicas originais }
   If cdsHipotese.FieldByName('VL_HIPOTESE').OldValue <>
     cdsHipotese.FieldByName('VL_HIPOTESE').AsFloat   Then
     vAlteracao := True;
end;

procedure TFrmVerHipoteses.bbtnConfirmarClick(Sender: TObject);
Var vCD_HIPOTESE:Integer;
    vDS_HIPOTESE:String;
begin
   inherited;
   If vAlteracao Then
   Begin
      try
         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         qryAux.Close;
         qryAux.Open;
         vCD_HIPOTESE := qryAux.FieldByName('Max_CD').AsInteger + 1;

         If MsgDlg('Itens da hípotese foi(ram) alterados' + Chr(13) +
                   'deseja gravar essa alteração?' ,'Informação',mtInformation,[mbYes, mbNo],0) = mrYes Then
         Begin
            vDS_HIPOTESE := InputBox('Digite um nome para a hípotese que será gravada', 'Cálculo Atuarial', '');

            If vDS_HIPOTESE = '' Then Exit;

            { Grava na tabela FI_HIPOTESE }
            With qryHipotese do
            Begin
               ParamByName('CD_HIPOTESE').AsInteger   := vCD_HIPOTESE;
               ParamByName('DS_HIPOTESE').AsString    := vDS_HIPOTESE;
               ParamByName('DT_GERACAO').AsDateTime   := Now;
               ParamByName('NR_IDADE_MIN_TB_SERV').AsInteger := 0;
               ParamByName('NR_IDADE_MAX_TB_SERV').AsInteger := 0;
               ParamByName('IDREGRA').AsInteger       := cdsHipotese.FieldByName('IDREGRA').AsInteger;
               ExecSQL;
            End;

            { Grava na tabela FI_COMPOSICAO_HIPOTESE }
            cdsHipotese.First;
            While Not cdsHipotese.EOF do
            Begin
               With qryComposicao_Hipotese do
               Begin
                  ParamByName('CD_HIPOTESE').AsInteger := vCD_HIPOTESE;
                  ParamByName('CD_ITEM_HIPOTESE').AsInteger := cdsHipotese.FieldByName('CD_ITEM_HIPOTESE').AsInteger;
                  ParamByName('VL_HIPOTESE').AsFloat := cdsHipotese.FieldByName('VL_HIPOTESE').AsFloat;
                  ParamByName('IR_GERA_TAB_SERVICO').AsString := '';
                  ParamByName('SQ_VERSAO_COMUTACAO_MAS').AsInteger := cdsHipotese.FieldByName('SQ_VERSAO_COMUTACAO_MAS').AsInteger;
                  ParamByName('SQ_VERSAO_COMUTACAO_FEM').AsInteger := cdsHipotese.FieldByName('SQ_VERSAO_COMUTACAO_FEM').AsInteger;
                  ParamByName('SQ_VERSAO_COMUTACAO_PEN').AsInteger := cdsHipotese.FieldByName('SQ_VERSAO_COMUTACAO_PEN').AsInteger;
                  ExecSQL;
               End;

               cdsHipotese.Next;
            End;
         End;

         FrmSimulacaoCalcAtuarial.qryHipotese.Close;
         FrmSimulacaoCalcAtuarial.qryHipotese.Open;

         FrmSimulacaoCalcAtuarial.DBLkpCmbBxHipotese.KeyValue := vCD_HIPOTESE;

         dtmBaseDados.dbBaseDados.commit;
         FrmSimulacaoCalcAtuarial.ssbReCalcHipote.Visible := False;

      except
          On E:EDBEngineError do
          begin
            MostrarErro(E);
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
          End;
      end;
   End;

   Close;
end;

end.
