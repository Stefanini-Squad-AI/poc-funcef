unit RHistCarteira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, fcButton, fcImgBtn, fcShapeBtn, StdCtrls, Grids, Wwdbigrd,
  Wwdbgrid, wwdblook, Db, DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect,
  DBGrids, FSairAjudaImob;

type
  TfrmRelHistCarteira = class(TfrmSairAjudaImob)
    dsHist: TwwDataSource;
    qryHistCarteiraDesc: TwwQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    DBcboCarteira: TwwDBLookupCombo;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    btnAcendente: TfcShapeBtn;
    btnDescendente: TfcShapeBtn;
    qryLookCarteira: TwwQuery;
    qryLookCarteiraIDCARTEIRAINVEST: TFloatField;
    qryLookCarteiraDESCCARTINVEST: TStringField;
    qryHistCarteiraDescIDCARTEIRAINVEST: TFloatField;
    qryHistCarteiraDescDATAMOVCARTINV: TDateTimeField;
    qryHistCarteiraDescVLRMOVCARTINV: TFloatField;
    qryHistCarteiraDescCOTASMOVCARTINV: TFloatField;
    qryHistCarteiraDescSALDOVLRCARTINV: TFloatField;
    qryHistCarteiraDescSALDOCOTASCARTINV: TFloatField;
    qryHistCarteiraDescIDINVESTIMENTO: TFloatField;
    qryHistCarteiraDescIDTIPOOPERACAO: TFloatField;
    qryHistCarteiraDescHISTMOVCARTINV: TStringField;
    qryHistCarteiraDescTIPMOVCARTINV: TStringField;
    qryHistCarteiraDescQTDEMOVINVCART: TFloatField;
    qryHistCarteiraDescSALDOQTDEINVCART: TFloatField;
    qryHistCarteiraDescSALDOVLRINVCART: TFloatField;
    qryHistInvestDesc: TwwQuery;
    DateTimeField3: TDateTimeField;
    StringField6: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    StringField7: TStringField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    Label5: TLabel;
    btnBuscaImovel: TBitBtn;
    edtMestre: TEdit;
    edtImovel: TEdit;
    btnLimpaContrato: TBitBtn;
    DBgrdHistorico: TDBGrid;
    qryHistCarteiraAsc: TwwQuery;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField2: TStringField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    qryHistInvestAsc: TwwQuery;
    DateTimeField2: TDateTimeField;
    StringField3: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    StringField4: TStringField;

    // procedimentos definidos
    procedure LimpaHistorico;
    procedure MostraHistorico;
    procedure DBgrdHistoricoTopRowChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBcboCarteiraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnAcendenteClick(Sender: TObject);
    procedure btnDescendenteClick(Sender: TObject);


  private { Private declarations }
   iImovel : integer;

  public { Public declarations }

  end;



var
  frmRelHistCarteira: TfrmRelHistCarteira;



implementation
{$R *.DFM}
uses
   uFuncoesImob, dLookImobiliario, DMS;



procedure TfrmRelHistCarteira.LimpaHistorico;
begin
   if iImovel = -1 then begin
      qryHistInvestDesc.Close;
      qryHistInvestAsc.Close;
   end;

   if DBcboCarteira.LookupValue = '' then begin
      qryHistCarteiraDesc.Close;
      qryHistCarteiraAsc.Close;
      qryHistInvestDesc.Close;
      qryHistInvestAsc.Close;
   end;
end;



procedure TfrmRelHistCarteira.MostraHistorico;
begin
   if iImovel > -1 then begin

      if DBcboCarteira.LookupValue <> '' then begin

         with qryHistInvestAsc do begin
            LimpaParametros(qryHistInvestAsc);
            ParamByName('INVEST').asInteger     := iImovel;
            ParamByName('CARTEIRA').asInteger   := StrToInt(DBcboCarteira.LookupValue);
            Open;
         end;

         with qryHistInvestDesc do begin
            LimpaParametros(qryHistInvestDesc);
            ParamByName('INVEST').asInteger     := iImovel;
            ParamByName('CARTEIRA').asInteger   := StrToInt(DBcboCarteira.LookupValue);
            Open;
         end;

         if btnDescendente.Down then begin
            dsHist.DataSet := qryHistInvestDesc;
         end else begin
            dsHist.DataSet := qryHistInvestAsc;
         end;

      end;

   end else begin

      if DBcboCarteira.LookupValue <> '' then begin

         with qryHistCarteiraAsc do begin
            LimpaParametros(qryHistCarteiraAsc);
            ParamByName('CARTEIRA').asInteger := StrToInt(DBcboCarteira.LookupValue);
            Open;
         end;

         with qryHistCarteiraDesc do begin
            LimpaParametros(qryHistCarteiraDesc);
            ParamByName('CARTEIRA').asInteger := StrToInt(DBcboCarteira.LookupValue);
            Open;
         end;

         if btnDescendente.Down then begin
            dsHist.DataSet := qryHistCarteiraDesc;
         end else begin
            dsHist.DataSet := qryHistCarteiraAsc;
         end;

      end;

   end;
end;



procedure TfrmRelHistCarteira.DBgrdHistoricoTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   DBgrdHistorico.Invalidate;
end;



procedure TfrmRelHistCarteira.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   qryHistCarteiraDesc.Close;
   qryHistCarteiraDesc.UnPrepare;

   qryHistCarteiraAsc.Close;
   qryHistCarteiraAsc.UnPrepare;

   qryHistInvestDesc.Close;
   qryHistInvestDesc.UnPrepare;

   qryHistInvestAsc.Close;
   qryHistInvestAsc.UnPrepare;

   qryLookCarteira.Close;
   qryLookCarteira.UnPrepare;
end;



procedure TfrmRelHistCarteira.btnBuscaImovelClick(Sender: TObject);
begin
   dtmMS.MS_Imovel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Imovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovel        := StrToInt(dtmMS.MS_Imovel.ValoresChave[1]);
      edtImovel.Text := dtmMS.MS_Imovel.ValoresChave[2];
      edtMestre.Text := dtmMS.MS_Imovel.ValoresChave[3];

      LimpaHistorico;
      MostraHistorico;

      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmRelHistCarteira.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   LimpaHistorico;
   MostraHistorico;
end;



procedure TfrmRelHistCarteira.FormShow(Sender: TObject);
begin
   inherited;

   iImovel := -1;
   qryLookCarteira.Open;
end;



procedure TfrmRelHistCarteira.DBcboCarteiraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   LimpaHistorico;
   MostraHistorico;
end;



procedure TfrmRelHistCarteira.btnAcendenteClick(Sender: TObject);
begin
   inherited;
   LimpaHistorico;
   MostraHistorico;
end;



procedure TfrmRelHistCarteira.btnDescendenteClick(Sender: TObject);
begin
   inherited;
   LimpaHistorico;
   MostraHistorico;
end;



end.
