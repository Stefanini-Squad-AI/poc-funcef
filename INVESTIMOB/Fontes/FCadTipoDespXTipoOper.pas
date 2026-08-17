unit FCadTipoDespXTipoOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroDetalhe, CmEventosCadastro, Db, Wwdatsrc, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  Grids, Wwdbigrd, Wwdbgrid, TB97, ComCtrls, ExtCtrls, DBCtrls, wwdblook;

type
  TFrmCadTipoDespXTipoOper = class(TfrmCadastroDetalhe)
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDTIPODESPINVEST: TFloatField;
    qryIDREGRACALCDESP: TFloatField;
    qryIDREGRADATAVENC: TFloatField;
    qryFLGCALCDIARIO: TFloatField;
    qryFLGGERACONTAB: TFloatField;
    qryFLGGERACAPCAR: TFloatField;
    qryRECPAG: TStringField;
    qryCODTIPDOC: TFloatField;
    qryFLGGERACAF: TFloatField;
    qryDESCTIPODESPINV: TStringField;
    qryLookTipoDespesa: TwwQuery;
    qryLookTipoDespesaDESCTIPODESPINV: TStringField;
    qryLookTipoDespesaIDTIPODESPINVEST: TFloatField;
    qryLookTipoDoc: TwwQuery;
    qryLookTipoDocDESCRICAO: TStringField;
    qryLookTipoDocCODTIPDOC: TFloatField;
    qryLookTipoDocRECPAG: TStringField;
    qryLookTipoDocDEBCRE: TStringField;
    Label1: TLabel;
    DBcboTipoOperacao: TwwDBLookupCombo;
    Label3: TLabel;
    DBcboTipoDespesa: TwwDBLookupCombo;
    DBrdgRecPagDesp: TDBRadioGroup;
    GroupBox1: TGroupBox;
    DBchkGeraContab: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBchkGeraCAPCAR: TDBCheckBox;
    Label2: TLabel;
    DBcboTipoDoc: TwwDBLookupCombo;
    rdoRecPag: TRadioGroup;
    procedure DBcboTipoOperacaoChange(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    iIdTipooperacao: integer;

    function VerificaPreenchimento: boolean;

  public
    { Public declarations }
  end;

var
  FrmCadTipoDespXTipoOper: TFrmCadTipoDespXTipoOper;

implementation

uses dLookImobiliario, uComunsImobiliario, uVerificaPreenchimento, UFuncoesImob, UMensErro;

{$R *.DFM}

procedure TFrmCadTipoDespXTipoOper.DBcboTipoOperacaoChange(
  Sender: TObject);
begin
   inherited;
   if (DBcboTipoOperacao.LookupValue[1] in ['P','U']) then rdoRecPag.ItemIndex := 0 {P U}
   else rdoRecPag.ItemIndex := 1;  {D R}

   iIdTipooperacao := StrToInt(DBcboTipoOperacao.LookupValue);

   CmeCadastroFind(self);
end;

procedure TFrmCadTipoDespXTipoOper.CmeCadastroFind(Sender: TObject);
var
   sRecPag, sDebCre: string;
begin
   inherited;
   LimpaParametros(qry);
   with qry do begin
      ParamByName('PIDTIPOINVEST').asInteger   := 3;
      ParamByName('PIDTIPOOPERACAO').asInteger := iIdTipooperacao;
      Open;
   end;

   case dtmLookImobiliario.qryLookTipoOperInvestRECPAG.AsString[1] of
      'D': // desconto - diminui CAR
      begin
         sRecPag := 'R';
         sDebcre := 'C';
      end;
      'P': // pagamento - aumenta CAP
      begin
         sRecPag := 'P';
         sDebcre := 'C';
      end;
      'R': // recebimento - aumenta CAR
      begin
         sRecPag := 'R';
         sDebcre := 'D';
      end;
      'U': // pagamento - diminui CAP
      begin
         sRecPag := 'P';
         sDebcre := 'D';
      end;
   end;


   LimpaParametros(qryLookTipoDoc);
   qryLookTipoDoc.ParamByName('RECPAG').AsString := sRecPag;
   qryLookTipoDoc.ParamByName('DEBCRE').AsString := sDebCre;
   qryLookTipoDoc.Open;
end;

procedure TFrmCadTipoDespXTipoOper.FormCreate(Sender: TObject);
begin
   inherited;
   iIdTipooperacao := -1;
   LimpaParametros(dtmLookImobiliario.qryLookTipoOperInvest);
   dtmLookImobiliario.qryLookTipoOperInvest.Open;

   LimpaParametros(qryLookTipoDespesa);
   qryLookTipoDespesa.Open;

end;

procedure TFrmCadTipoDespXTipoOper.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   qryIDTIPOINVEST.asInteger    := 3;
   qryIDTIPOOPERACAO.asInteger  := StrToInt(DBcboTipoOperacao.LookupValue);

   qryFLGGERACONTAB.asInteger   := 1;
   qryFLGGERACAPCAR.asInteger   := 1;
   qryFLGGERACAF.asInteger      := 0;
end;

function TFrmCadTipoDespXTipoOper.VerificaPreenchimento: boolean;
begin
   Result := False;
   try

      if DBcboTipoOperacao.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Operação!', DBcboTipoOperacao);

      if DBcboTipoDespesa.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Despesa!', DBcboTipoDespesa);

   except

    	on ev : EValidacao do begin
           if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
	   Repaint;
           if ev.Control.CanFocus then ev.Control.SetFocus;
           Exit;
        end;

   end;
   Result := True;
end;

procedure TFrmCadTipoDespXTipoOper.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := VerificaPreenchimento;
end;

procedure TFrmCadTipoDespXTipoOper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryLookTipoDespesa.Close;
   qryLookTipoDoc.Close;
   dtmLookImobiliario.qryLookTipoOperInvest.Close;
end;

procedure TFrmCadTipoDespXTipoOper.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   CmeCadastroFind(self);  // update na query
end;

end.
