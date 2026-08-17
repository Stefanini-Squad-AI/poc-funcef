unit FCadItemDetalhe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, StdCtrls, DBCtrls, fcLabel, ExtCtrls, Db, DBTables, uCtrlPadroes,
  Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, uMensErro, uSistema,
  mRegraDB, Mask, wwdbedit, uCMClientDataSet, Wwdbspin, DBClient, uCtrlFormaCalcImob, uModuloImobiliario;

type
  TfrmCadItemDetalhe = class(TFrmOkCancelarImob)
    dsItem: TDataSource;
    rdgTipoEvento: TDBRadioGroup;
    lblNomeItem: TfcLabel;
    chkCentraliza: TDBCheckBox;
    chkGravaZero: TDBCheckBox;
    rdgTrataSaldoDev: TDBRadioGroup;
    lblSeqCalculo: TLabel;
    DBspnSeqCalculo: TwwDBSpinEdit;
    molRegraCalculo: TmolRegraDB;
    cds: TCMClientDataSet;
    cdsVerificaSeq: TCMClientDataSet;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    FCodItem: Integer;
    FItem: String;
    FiForma: Integer;

    CtrlFormaCalcImob : TCtrlFormaCalcImob;
    
    procedure SetCodItem(const Value: Integer);
    procedure SetItem(const Value: String);
    procedure SetiForma(const Value: Integer);

    function VerificaPreenchimento: Boolean;

    { Private declarations }
  public
    { Public declarations }
    property iForma  : Integer read FiForma  write SetiForma;
    property CodItem : Integer read FCodItem write SetCodItem;
    property Item    : String  read FItem    write SetItem;
  end;

var
  frmCadItemDetalhe: TfrmCadItemDetalhe;

implementation

{$R *.DFM}

uses
  uVerificaPreenchimento;

{ TfrmCadItemDetalhe }

procedure TfrmCadItemDetalhe.SetCodItem(const Value: Integer);
begin
   FCodItem := Value;
end;



procedure TfrmCadItemDetalhe.SetItem(const Value: String);
begin
   FItem := Value;
end;



procedure TfrmCadItemDetalhe.SetiForma(const Value: Integer);
begin
   FiForma := Value;
end;



function TfrmCadItemDetalhe.VerificaPreenchimento: Boolean;
begin
   Result := False;

   try

      if molRegraCalculo.iRegra < 0 then
         raise EValidacao.CreateVal('É necessário indicar a Regra de Cálculo do Item!', molRegraCalculo.btnBuscaRegra);

      if rdgTipoEvento.ItemIndex = -1 then
         raise EValidacao.CreateVal('É necessário indicar o Evento desse item!', rdgTipoEvento);

      if rdgTrataSaldoDev.ItemIndex = -1 then
         raise EValidacao.CreateVal('É necessário indicar a forma de Tratamento quanto ao Saldo Devedor!', rdgTrataSaldoDev);

      if DBspnSeqCalculo.Value = 0 then
         raise EValidacao.CreateVal('É necessário indicar sequência de cálculo!', DBspnSeqCalculo);

      cdsVerificaSeq.Data := CtrlFormaCalcImob.LookupItemXFormaCalc(FiForma);

      while not cdsVerificaSeq.eof do
      begin
         if cdsVerificaSeq.FieldByName('IDTIPOCUSTORECIMO').AsInteger <> FCodItem then
            if cdsVerificaSeq.FieldByName('SEQCALCULO').AsInteger = Trunc(DBspnSeqCalculo.Value) then
               raise EValidacao.CreateVal('Existe outro item com essa sequência de cálculo!', DBspnSeqCalculo);

         cdsVerificaSeq.Next;
      end;

   except

      on ev : EValidacao do begin
	 if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
 	 Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmCadItemDetalhe.FormShow(Sender: TObject);
begin
   inherited;
   lblNomeItem.Caption := FItem;
   cds.Data := CtrlFormaCalcImob.LookupItemXFormaCalc(iForma,-1,CodItem);
   if not cds.IsEmpty then
   begin
      cds.Edit;
   end;
end;



procedure TfrmCadItemDetalhe.bbtnConfirmarClick(Sender: TObject);
begin
   if not VerificaPreenchimento then Exit;

   if not CtrlFormaCalcImob.GravaItemFormaCalcImob then
      MsgDlg(CtrlFormaCalcImob.MessageInfo,'Aviso',mtWarning,[mbOK],0);

   Close;
end;



procedure TfrmCadItemDetalhe.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlFormaCalcImob := TCtrlFormaCalcImob.Create;
   CtrlFormaCalcImob.InitializeAs(Padroes);
   CtrlFormaCalcImob.CdsItemFormaCalc := cds;
   molRegraCalculo.MS_Regra.Filtro.Add('TR.IDGRUPOREGRA = ' + IntToStr(ModuloImobiliario.AdminImob.iGrupoRegra));
end;



procedure TfrmCadItemDetalhe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlFormaCalcImob);
   inherited;
end;



procedure TfrmCadItemDetalhe.bbtnCancelarClick(Sender: TObject);
begin
   if cds.State in dsEditModes then cds.Cancel;
   Close;
end;



end.
