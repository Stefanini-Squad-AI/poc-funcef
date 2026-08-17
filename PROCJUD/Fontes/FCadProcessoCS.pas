unit FCadProcessoCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Wwtable,
  CMProcura, DBCtrls, Dateedit, Mask, wwdblook, Wwdbspin, wwdbedit, TREdit;

type
  TfrmCadProcessoCS = class(TfrmCadMestreDetalheCS)
    MontaSelectAdv: TMontaSelect;
    MontaSelectContraParte: TMontaSelect;
    MontaSelectCidade: TMontaSelect;
    ds2: TwwDataSource;
    qryEtapa: TwwQuery;
    tblTipRec: TwwTable;
    tblVara: TwwTable;
    tblTRT: TwwTable;
    qryProcVinc: TwwQuery;
    qryPartic: TwwQuery;
    ds5: TwwDataSource;
    qryTipAcao: TwwQuery;
    ds4: TwwDataSource;
    tblTipSent: TwwTable;
    dsProcVinc: TwwDataSource;
    qryAdvCasa: TwwQuery;
    qryTipoProc: TwwQuery;
    tblObjeto: TwwTable;
    tblObjetoDescricao: TStringField;
    tblObjetoVALORRECL: TFloatField;
    tblObjetoPERCPROB: TFloatField;
    tblObjetoValorEsperado: TFloatField;
    tblObjetoVALORSENTENCA: TFloatField;
    tblObjetoNUMPROCTRAB: TFloatField;
    tblObjetoCODTIPOOBJETO: TFloatField;
    tblObjetoOBSERVACAO: TStringField;
    tblTipObj: TwwTable;
    tblTipObj2: TwwTable;
    Label1: TLabel;
    dbedNumero: TDBEdit;
    Label2: TLabel;
    dbedDataAju: TDBDateEdit;
    rgSituacao: TDBRadioGroup;
    Label19: TLabel;
    dbedDataNot: TDBDateEdit;
    Label30: TLabel;
    dbedNumJCJ: TDBEdit;
    rgAtivo: TDBRadioGroup;
    dbrgMateria: TDBRadioGroup;
    Label12: TLabel;
    CMProcuraParticipante: TCMProcura;
    tbshReclamante: TTabSheet;
    tbshOutrosDados: TTabSheet;
    tbshEncer: TTabSheet;
    tbsEtapas: TTabSheet;
    tbsObsEtp: TTabSheet;
    tbshVinculos: TTabSheet;
    Label40: TLabel;
    dbedRazao: TDBEdit;
    Label32: TLabel;
    dbedInscNum: TDBEdit;
    dbrgTipoPessoa: TDBRadioGroup;
    Label11: TLabel;
    dbedEmail: TDBEdit;
    Label23: TLabel;
    dbedLogra: TDBEdit;
    dbedNumLogra: TDBEdit;
    dbedComplem: TDBEdit;
    dbedBairro: TDBEdit;
    dbedCEP: TDBEdit;
    dbedCidade: TDBEdit;
    dbedUF: TDBEdit;
    dblcVara: TwwDBLookupCombo;
    Label3: TLabel;
    dbedPost: TDBDateEdit;
    Label16: TLabel;
    dbedNumTRT: TDBEdit;
    Label20: TLabel;
    CMProcuraAdv1: TCMProcura;
    Label18: TLabel;
    dbedQtde: TDBEdit;
    Label17: TLabel;
    dbedNumTST: TDBEdit;
    Label21: TLabel;
    CMProcuraAdv2: TCMProcura;
    Label31: TLabel;
    dblcTipProc: TwwDBLookupCombo;
    Label22: TLabel;
    Label33: TLabel;
    dblcTipAcao: TwwDBLookupCombo;
    Label34: TLabel;
    dllcAdvCasa: TwwDBLookupCombo;
    Label35: TLabel;
    dbedPasta: TDBEdit;
    Label36: TLabel;
    ProcuraCidade: TCMProcura;
    CMProcuraAss: TCMProcura;
    Label8: TLabel;
    dbreDespesa: TDBRealEdit;
    dbedNumVara: TwwDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dblcTipObj: TwwDBLookupCombo;
    Label6: TLabel;
    dbedValRecl: TDBEdit;
    Label7: TLabel;
    dbedPerc: TDBEdit;
    Label24: TLabel;
    edValor: TRealEdit;
    lblValReal: TLabel;
    dbedValReal: TDBEdit;
    Label39: TLabel;
    dbmemObserv: TDBMemo;
    rgTipEncer: TDBRadioGroup;
    gbxAcordo: TGroupBox;
    sbspeParc: TwwDBSpinEdit;
    gbxDataEncer: TGroupBox;
    dbedEncerr: TDBDateEdit;
    gbxSent: TGroupBox;
    dblcTipSent: TwwDBLookupCombo;
    Label15: TLabel;
    dbedPrevEnc: TDBDateEdit;
    dbGrd: TwwDBGrid;
    Label25: TLabel;
    DBEdit1: TDBEdit;
    Label26: TLabel;
    DBEdit2: TDBEdit;
    Label27: TLabel;
    DBEdit4: TDBEdit;
    Label29: TLabel;
    DBMemo1: TDBMemo;
    pnlLigado: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    spbProcVinc: TSpeedButton;
    spbApagaVinc: TSpeedButton;
    dbrgVinc: TDBRadioGroup;
    dbedNumVinc: TDBEdit;
    gbxVinculados: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    Label28: TLabel;
    dbreCusto: TDBRealEdit;
    Label14: TLabel;
    redValorAtual: TRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure tblObjetoCalcFields(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipEncerClick(Sender: TObject);
    procedure tblObjetoAfterPost(DataSet: TDataSet);
    procedure tblObjetoBeforeEdit(DataSet: TDataSet);
    procedure FazerProcurar; override;
    procedure tblObjetoAfterInsert(DataSet: TDataSet);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure dbreCustoChange(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure spbProcVincClick(Sender: TObject);
    procedure rgSituacaoClick(Sender: TObject);
    procedure MudaReclamante;
    procedure tbshReclamanteEnter(Sender: TObject);
    procedure spbApagaVincClick(Sender: TObject);
  protected
    function VerificaMestre : boolean; override;
    function PostMestre : boolean ; override;
    function PostDetalhe: Boolean; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProcessoCS: TfrmCadProcessoCS;

implementation

{$R *.DFM}

procedure TfrmCadProcessoCS.FormCreate(Sender: TObject);
begin
  inherited;
  tblTipObj.Open;
  tblTipObj2.Open;
  tblVara.Open;
  tblTRT.Open;
  tblTipSent.Open;
//  qryEtapa.Open;
  tblObjeto.Open;
  tblTipRec.Open;
  qryTipoProc.Open;
  qryAdvCasa.Open;
  qryTipAcao.Open;
  qryProcVinc.Open;

end;

procedure TfrmCadProcessoCS.tblObjetoCalcFields(DataSet: TDataSet);
begin
  inherited;
  tblObjetoVALORESPERADO.Value := (tblObjetoVALORRECL.Value *
                                   tblObjetoPERCPROB.Value) / 100;
  edValor.Value := tblObjetoVALORESPERADO.Value;
end;

procedure TfrmCadProcessoCS.bbtnConfirmarClick(Sender: TObject);
begin
  if  (ds.Dataset.State = dsInsert)  and
      (tblProcesso.FieldByName('DATANOTIF').Value <> Null) then
      tblProcesso.FieldByName('DATAPREVENCER').Value :=
         tblProcesso.FieldByName('DATANOTIF').Value + int(365.25 * 5);
  inherited;

end;

procedure TfrmCadProcessoCS.rgTipEncerClick(Sender: TObject);
begin
  inherited;
  if  (rgTipEncer.ItemIndex = 1) or (rgTipEncer.ItemIndex = 3) then
  begin
      MsgDlg('Não Esqueça de Atualizar os Valores Reais dos Objetos',
              'Aviso',mtInformation,[mbOk, mbHelp], 0);
  end;

  gbxAcordo.Visible := rgTipEncer.ItemIndex = 1;
  gbxSent.Visible := rgTipEncer.ItemIndex = 3;

end;

procedure TfrmCadProcessoCS.tblObjetoAfterPost(DataSet: TDataSet);
begin
  inherited;
  tblProcesso.FieldByName('CUSTOPROC').Value :=
              tblProcesso.FieldByName('CUSTOPROC').Value +
              (1 - rgSituacao.ItemIndex) *
               tblObjetoVALORESPERADO.Value  +
              rgSituacao.ItemIndex *
               tblObjetoVALORSENTENCA.Value - ValAntes;
end;

procedure TfrmCadProcessoCS.tblObjetoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if  tblObjetoVALORSENTENCA.Value = 0 then
        ValAntes := tblObjetoVALORESPERADO.Value
  else  ValAntes := tblObjetoVALORSENTENCA.Value;
end;

procedure TfrmCadProcessoCS.FazerProcurar;
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
{     qry.Close;
     qry.ParamByName('IdPessoa').AsInteger    := StrToInt(MontaSelect.ValoresChave[0]);
     qry.ParamByName('CodTipoAval').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
     qry.ParamByName('NumSeq').AsInteger      := StrToInt(MontaSelect.ValoresChave[2]);
     qry.Open;
  end;}
  qry.Locate('NUMPROCTRAB',StrToFloat(MontaSelect.ValoresChave[0],[]));
  qryAfterScroll(ds.Dataset);
  end;
end;

function TfrmCadProcessoCS.VerificaMestre : boolean;
begin
   Result := True;
end;

function TfrmCadProcessoCS.PostMestre : boolean;
begin
   // Post na Query do Pai e posicionamento no registro que está sendo inserido.
   ds.DataSet.Post;
   Result := True;
end;

function TfrmCadProcessoCS.PostDetalhe: Boolean;
begin
   dsDet.DataSet.Post;
   Result := True;
end;


procedure TfrmCadProcessoCS.tblObjetoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tblObjetoVALORSENTENCA.Value := 0;
end;

procedure TfrmCadProcessoCS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryEtapa.Close;
  qryEtapa.ParamByName('NumProcTrab').AsFloat :=
     qry.FieldByName('NUMPROCTRAB').AsFloat;
  qryEtapa.Open;
  tbshEncer.Visible    := rgSituacao.ItemIndex = 1;
  rgTipEncer.Visible   := rgSituacao.ItemIndex = 1;
  gbxDataEncer.Visible := rgSituacao.ItemIndex = 1;
  gbxAcordo.Visible    := rgTipEncer.ItemIndex = 1;
  gbxSent.Visible      := rgTipEncer.ItemIndex = 3;
  lblValReal.Visible   := rgSituacao.ItemIndex = 1;
  dbedValReal.Visible  := rgSituacao.ItemIndex = 1;
  dbreCustoChange(Self);
  MudaReclamante;
  spbApagaVinc.Enabled := qry.FieldByName('IDPROCVINCULADO').Value <> Null;

end;

procedure TfrmCadProcessoCS.bbtnOkDetClick(Sender: TObject);
begin

  if  Trim(dblcTipObj.Text) = ''  then begin
       MsgDlg('Tipo de Objeto Não Identificado','Aviso',mtInformation,[mbOk,mbHelp],0);
       dblcTipObj.SetFocus;
       Exit;
  end;

  if  Trim(dbedValRecl.Text) = ''  then begin
       MsgDlg('Valor Reclamado Não Informado','Aviso',mtInformation,[mbOk,mbHelp],0);
       dbedValRecl.SetFocus;
       Exit;
  end;

  if (Trim(edValor.Text) = '') and (Trim(dbedPerc.Text) = '')
  then begin
       MsgDlg('Informe Percentual ou Valor Esperado','Aviso',mtInformation,[mbOk,mbHelp],0);
       dbedPerc.SetFocus;
       Exit;
  end;

  if (Trim(edValor.Text) <> '') and (Trim(dbedPerc.Text) = '')
  then  dbedPerc.Text := FloatToStr(edValor.Value * 100 /
                                    StrToFloat(dbedValRecl.Text));
  inherited;
end;

procedure TfrmCadProcessoCS.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('NUMPROCTRAB').Value := LeUltRegistro(nil,'PROCESSOTRAB');
  qry.FieldByName('FLGSITPROC').Value := 0;
  qry.FieldByName('CUSTOPROC').Value := 0;
  qry.FieldByName('DESPESAPROC').Value := 0;
  qry.FieldByName('DATAPREVENCER').Value := Date + round(365.25 * 5);
  qry.FieldByName('INDMATERIA').Value := 4;
end;

procedure TfrmCadProcessoCS.dbreCustoChange(Sender: TObject);
begin
  inherited;
  if  not  qryPartic.Active  then  exit;
  redValorAtual.Value := ValorAtual(tblProcesso.FieldByName('CUSTOPROC').AsFloat,
                                    tblProcesso.FieldByName('DATANOTIF').AsString);
end;

procedure TfrmCadProcessoCS.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  dblcTipObj.SetFocus;
end;

procedure TfrmCadProcessoCS.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  dblcTipObj.SetFocus;
end;

procedure TfrmCadProcessoCS.spbProcVincClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '')  and
     ((ds.Dataset.State = dsInsert) or (ds.Dataset.State = dsEdit))
  then begin
       qry.FieldByName('IDPROCVINCULADO').Value :=
         StrToFloat(MontaSelectProc.ValoresChave[0]);
       spbApagaVinc.Enabled := True;
  end;

end;

procedure TfrmCadProcessoCS.rgSituacaoClick(Sender: TObject);
begin
  inherited;
  if  rgSituacao.ItemIndex = 0  then begin
      if MsgDlg('Deseja Reabrir o Processo ?', LerMensagem(4),
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes
      then begin
          qry.FieldByName('FLGSITPROC').Value := 0;
          qry.FieldByName('DATAEFETENC').Value := Null;
          bbtnConfirmarClick(rgSituacao);
      end
      else begin
          rgSituacao.OnClick := Nil;
          rgSituacao.ItemIndex := 1;
          rgSituacao.OnClick := rgSituacaoClick;
      end;
  end

  else begin
      if MsgDlg('Deseja Encerrar o Processo ?', LerMensagem(4),
                 mtConfirmation, [mbYes, mbNo], 0) <> mrYes
      then begin
          bbtnCancelarClick(rgSituacao);
          rgSituacao.OnClick := Nil;
          rgSituacao.ItemIndex := 0;
          rgSituacao.OnClick := rgSituacaoClick;
      end
      else  begin
          qry.FieldByName('DATAEFETENC').Value := date;
          pgctrlDetalhe.ActivePage := tbshEncer;
      end;
  end;
  tbshEncer.Visible    := rgSituacao.ItemIndex = 1;
  rgTipEncer.Visible   := rgSituacao.ItemIndex = 1;
  gbxDataEncer.Visible := rgSituacao.ItemIndex = 1;
  lblValReal.Visible   := rgSituacao.ItemIndex = 1;
  dbedValReal.Visible  := rgSituacao.ItemIndex = 1;
end;

procedure TfrmCadProcessoCS.MudaReclamante;
begin
   qryPartic.Close;
   qryPartic.ParamByName('IDRECLAMANTE').AsInteger :=
             qry.FieldByName('IDRECLAMANTE').AsInteger;
   qryPartic.Open;
end;

procedure TfrmCadProcessoCS.tbshReclamanteEnter(Sender: TObject);
begin
  inherited;
  MudaReclamante;
end;

procedure TfrmCadProcessoCS.spbApagaVincClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma a Excluão do Vínculo ?', LerMensagem(4),
             mtConfirmation, [mbYes, mbNo], 0) <> mrYes
  then  exit;
  if  (ds.State <> dsEdit) and  (ds.State <> dsInsert) then ds.Dataset.Edit;
  qry.FieldByName('IDPROCVINCULADO').Value := Null;
  qry.FieldByName('FLGVINCULADO').Value := Null;
  spbApagaVinc.Enabled := False;
end;

end.
