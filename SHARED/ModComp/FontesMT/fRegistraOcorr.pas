{***************************************************************************************
Nº SOL: 250384.17324
Nº PPM 1070235
Data da Alteração: 24/02/2016
Alteração Form: Leiaute e campos novos
Responsável: Michelle Suellyn Mota
Descrição: Mudança no leiaute e campos novos para adequar ao eSocial
**************************************************************************************}
unit fRegistraOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  Buttons, TB97, ExtCtrls, Mask, wwdbedit, Db, DBTables, TREdit, wwdblook, Spin, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, MontaSelect, DBCtrls,
  DBClient, uCMClientDataSet, fSairAjuda, uCtrlTipOcMed, uCtrlRegOcorr, uCtrlMotivo;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235

type
  TfrmRegistraOcorr = class(TfrmSairAjuda)
    MontaSelectCID: TMontaSelect;             
    CdsTipoOcorr: TCMClientDataSet;
    Label2: TLabel;
    gbxDatas: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    dtedDataIni: TCMDateTimePicker;
    dtedDataFim: TCMDateTimePicker;
    Label5: TLabel;
    dblckTipoOcorr: TwwDBLookupCombo;
    Label1: TLabel;
    redLicenca: TRealEdit;
    Label4: TLabel;
    gbxExaminador: TGroupBox;
    Label7: TLabel;
    redAvaliacao: TRealEdit;
    grpCID: TGroupBox;
    edCODCID: TEdit;
    edCID: TEdit;
    bbtnBuscaCID: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    edAvaliador: TEdit;
    bbtnProcMedico: TBitBtn;
    edNomePessoa: TEdit;
    Label8: TLabel;
    dblckMotivoOficial: TwwDBLookupCombo;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtNroInscrCRMExaminador: TEdit;
    Label12: TLabel;
    edtTelContato: TEdit;
    Label13: TLabel;
    edtUFExaminador: TEdit;
    Label14: TLabel;
    grpVinculoAtestado: TGroupBox;
    Label15: TLabel;
    CdsMotivo: TCMClientDataSet;
    cbbTipoAcidTransito: TComboBox;
    cbbOrgaoClasse: TComboBox;
    CdsAtestadoAnt: TCMClientDataSet;
    CdsResponsavel: TCMClientDataSet;
    dbchkFLGALTERAMOTIVO: TCheckBox;
    dsAtestadoAnt: TDataSource;
    dbrgrpFLGEFEITORETRO: TRadioGroup;
    dbcbbIDATESTADOANT: TwwDBLookupCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnProcMedicoClick(Sender: TObject);
    procedure bbtnBuscaCIDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblckMotivoOficialChange(Sender: TObject);
    procedure dbchkFLGALTERAMOTIVOClick(Sender: TObject);
    procedure cbbTipoAcidTransitoChange(Sender: TObject);
    procedure cbbOrgaoClasseChange(Sender: TObject);
    procedure MostraDadosExaminador(vIdPessoa : integer);
    procedure dbcbbIDATESTADOANTChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbrgrpFLGEFEITORETROClick(Sender: TObject);

  private
    CtrlTipOcMed: TCtrlTipOcMed;
    CtrlRegOcorr: TCtrlRegOcorr;
    CtrlMotivo: TCtrlMotivo; //Michelle Mota - SOL: 250384.17324 - PPM: 1070235

    IdExaminador: double;
  public
    IdPessoa: double;

    class procedure RegistrarOcorrenciaMedica(IdPessoa: double; Nome: string;
      DataAfast, DataRet: TDate);
  end;

var
  frmRegistraOcorr: TfrmRegistraOcorr;
  //Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  ObrigaAtestAnt : Boolean ;
  TipoAcidTransito, OrgaoClasse, AtestadoAnt : Integer;
  FlgEfeitoRetro, FlgAlteraMotivo : string;
  //Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  
implementation

uses uMensErro, uCtrlFuncoesRH, fProcuraPessoaDoc, uCtrlPadroes;

{$R *.DFM}

class procedure TfrmRegistraOcorr.RegistrarOcorrenciaMedica(IdPessoa: double; Nome: string;
  DataAfast, DataRet: TDate);
var
  frm: TfrmRegistraOcorr;
begin
  frm := TfrmRegistraOcorr.Create(Application);
  frm.edNomePessoa.Text := Nome;
  frm.IdPessoa := IdPessoa;
  frm.dtedDataIni.Date := DataAfast;
  frm.dtedDataFim.Date := DataRet;

  if (frm.dtedDataIni.Date > 0) and (frm.dtedDataFim.Date > 0) then
    frm.redLicenca.Value := frm.dtedDataFim.Date - frm.dtedDataIni.Date
  else
    frm.redLicenca.Value := 0;

  frm.ShowModal;
  frm.Free;
end;

procedure TfrmRegistraOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegOcorr := TCtrlRegOcorr.Create;
  CtrlRegOcorr.InitializeAs(Padroes);

  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);   

  frmProcuraPessoaDoc := TfrmProcuraPessoaDoc.Create(Application);
  frmProcuraPessoaDoc.TabelaSubTipo := 'FORNSERV';
  frmProcuraPessoaDoc.FiltroSubTipo := 'FORNSERV.IDPESSOA = PESSOA.IDPESSOA';

  CdsTipoOcorr.Data := CtrlTipOcMed.ListTipoOcorrenciaMed;

  //Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CdsMotivo.Data := CtrlMotivo.ListMotivo_MODASM;
  ObrigaAtestAnt := False;

  TipoAcidTransito := 0;
  OrgaoClasse := 0;
  FlgAlteraMotivo := 'N';
  FlgEfeitoRetro := 'N';
  AtestadoAnt := 0;
  //Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  
  IdExaminador := 0;
end;

procedure TfrmRegistraOcorr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipOcMed);
  FreeAndNil(CtrlRegOcorr);
  FreeAndNil(frmProcuraPessoaDoc);
  FreeAndNil(CtrlMotivo);//Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  inherited;
end;

procedure TfrmRegistraOcorr.bbtnProcMedicoClick(Sender: TObject);
begin
  if (frmProcuraPessoaDoc.ShowModal = mrOk) then
  begin
    IdExaminador := StrToFloat(frmProcuraPessoaDoc.sIdPessoa);
    edAvaliador.Text := frmProcuraPessoaDoc.sNomePessoa;
    MostraDadosExaminador( StrToInt( frmProcuraPessoaDoc.sIdPessoa ) ); //Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  end;
end;
// Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
procedure TfrmRegistraOcorr.MostraDadosExaminador(vIdPessoa : integer);
begin
    CdsResponsavel.Data := CtrlRegOcorr.ListResponsavel(vIdPessoa, 'R');
    edtNroInscrCRMExaminador.Text := CdsResponsavel.FieldByName('CRM_CRE_CRO').AsString;
    edtUFExaminador.Text := CdsResponsavel.FieldByName('UF_CRM').AsString;
    CdsResponsavel.Data := CtrlRegOcorr.ListRespTelefone(vIdPessoa);
    edtTelContato.Text := CdsResponsavel.FieldByName('TEL_CONTATO').AsString;
end;
// Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

procedure TfrmRegistraOcorr.bbtnBuscaCIDClick(Sender: TObject);
begin
  MontaSelectCID.Executar;
  if (MontaSelectCID.RetornouValor) then
  begin
    edCODCID.Text := MontaSelectCID.ValoresChave[0];
    edCID.Text := MontaSelectCID.ValoresChave[1];
  end;
end;

procedure TfrmRegistraOcorr.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dblckTipoOcorr.Text) = '')  then
  begin
    MsgDlg('Informe o Tipo de Ocorrência.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);// Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    dblckTipoOcorr.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if (Trim(dtedDataIni.Text) = '')  then
  begin
    MsgDlg('Preencha a Data de Afastamento.', 'Aviso', mtWarning, [mbOk,mbHelp], 0); // Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    dtedDataIni.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if (Trim(dtedDataFim.Text) = '')  then
  begin
    MsgDlg('Preencha a Data de Retorno.', 'Aviso', mtWarning, [mbOk,mbHelp], 0); // Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    dtedDataFim.SetFocus;
    ModalResult := mrNone;
    exit;
  end;
  // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  if (Trim(dblckMotivoOficial.Text) = '')  then
  begin
    MsgDlg('Informe o Motivo Oficial.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  if (cbbTipoAcidTransito.Enabled = True) and (Trim(cbbTipoAcidTransito.Text) = '') then
  begin
    MsgDlg('Preencha o Tipo de Acidente de Trânsito.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  if ((ObrigaAtestAnt) and (dbcbbIDATESTADOANT.Text = ''))then
  begin
    MsgDlg('O campo Atestado Anterior é obrigatório.' , 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  if (Trim(edAvaliador.Text) = '')  then
  begin
    MsgDlg('Campo Examinador (Médico/Entidade) obrigatório.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  if (Trim(cbbOrgaoClasse.Text) = '')  then
  begin
    MsgDlg('Preencha o Tipo de órgão de classe.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  if (dtedDataIni.Date ) >  (dtedDataFim.Date) then
  begin
    MsgDlg('A Data de Retorno deve ser maior ou igual a Data de Afastamento, verifique.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;
    
  if (CtrlRegOcorr.InserirOcorrencia(IdPessoa,
    CdsTipoOcorr.FieldByName('CODTIPOOCMED').asInteger, dtedDataIni.Date, dtedDataFim.Date,
    IdExaminador,CdsMotivo.FieldByName('IDMOTIVO').AsInteger,TipoAcidTransito,OrgaoClasse,{IdMotivo, TipoAcidTransito, OrgaoClasse}
    edAvaliador.Text, edCODCID.Text,
    FlgAlteraMotivo, FlgEfeitoRetro,{FlgAlteraMotivo, FlgEfeitoRetro}
    redLicenca.Value, redAvaliacao.Value,
    AtestadoAnt{AtestadoAnt})) then
    MsgDlg('Processo concluído com sucesso.', 'Informação', mtInformation, [mbOk,mbHelp], 0)
  else
    MsgDlg(CtrlRegOcorr.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

    {InserirOcorrencia(IdPessoa: double; CodTipoOcMed: integer; DataIni, DataFim: TDate;
      IdExaminador, IdMotivo, TipoAcidTransito, OrgaoClasse: double;
      Avaliador, CodCID, FlgAlteraMotivo, FlgEfeitoRetro: string; Licenca, Avaliacao,
      AtestadoAnt: double): boolean;}

  // Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
end;
// Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
procedure TfrmRegistraOcorr.dblckMotivoOficialChange(Sender: TObject);
begin
  inherited;
  if (CdsMotivo.FieldByName('idmotivo').AsInteger in [46,47,43,24] ) then
    begin
      cbbTipoAcidTransito.Enabled := True;
      cbbTipoAcidTransito.Color := clWhite;
    end
  else
    begin
      cbbTipoAcidTransito.Enabled := False;
      cbbTipoAcidTransito.Text := '';
      cbbTipoAcidTransito.Color := clSilver;
    end;
end;

procedure TfrmRegistraOcorr.dbchkFLGALTERAMOTIVOClick(Sender: TObject);
begin
  inherited;
  if (dbchkFLGALTERAMOTIVO.Checked) then
    begin
      dbrgrpFLGEFEITORETRO.Enabled := True;
      ObrigaAtestAnt := True;
      FlgAlteraMotivo := 'S';
    end
  else
    begin
      dbrgrpFLGEFEITORETRO.Enabled := False;
      dbrgrpFLGEFEITORETRO.ItemIndex := 1; // marca como Não
      ObrigaAtestAnt := False;
      FlgEfeitoRetro := 'N';
      FlgAlteraMotivo := 'N';
    end;
end;

procedure TfrmRegistraOcorr.cbbTipoAcidTransitoChange(Sender: TObject);
begin
  inherited;
  case cbbTipoAcidTransito.ItemIndex of
    0: TipoAcidTransito := 1;
    1: TipoAcidTransito := 2;
    2: TipoAcidTransito := 3;
  end;
end;

procedure TfrmRegistraOcorr.cbbOrgaoClasseChange(Sender: TObject);
begin
  inherited;
  case cbbOrgaoClasse.ItemIndex of
    0: OrgaoClasse := 1;
    1: OrgaoClasse := 2;
  end;
end;

procedure TfrmRegistraOcorr.dbcbbIDATESTADOANTChange(Sender: TObject);
begin
  inherited;
  AtestadoAnt := CdsAtestadoAnt.FieldByName('ATESTADOANT').AsInteger;

  if dbcbbIDATESTADOANT.Text = '' then
    AtestadoAnt := 0;       

  if ( dtedDataIni.Date <
       CdsAtestadoAnt.FieldByName('DATAREAL').AsDateTime ) and
     (dtedDataIni.text <> '')   then
    begin
      MsgDlg('"	O campo Datas >> Afastamento, deverá ser maior ou igual a data de afastamento do atestado escolhido no campo "Atestado Anterior".', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    end;
end;


procedure TfrmRegistraOcorr.FormShow(Sender: TObject);
begin
  inherited;
  CdsAtestadoAnt.Data := CtrlRegOcorr.ListAtestadoAnt( idpessoa );
end;

procedure TfrmRegistraOcorr.dbrgrpFLGEFEITORETROClick(Sender: TObject);
begin
  inherited;
  if (dbrgrpFLGEFEITORETRO.ItemIndex = 0) then
    begin
      FlgEfeitoRetro := 'S';
    end
  else
    begin
      FlgEfeitoRetro := 'N';
    end;
end;
// Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
end.
