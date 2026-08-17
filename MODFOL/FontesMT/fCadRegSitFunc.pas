{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
Rotina             :
N. SIG..........   : 38475.84868
Data da Alteração: : 15/04/2019
Alteração Form:    : fCadRegSitFunc
Responsável:       : Everson Cunha
Descrição.......   : Melhoria no Registro de Alteração da Situação Funcional,
                     para adequação ao leiaute s-2298 do eSocial.
                     (versão hoje: 2.5.01)
--------------------------------------------------------------------------------
Rotina             : bbtnOkDetClick
N. SIG..........   : 38475.60439
Data da Alteração: : 19/12/2017
Alteração Form:    : fCadRegSitFunc
Responsável:       : Cássio Florêncio Rovaroto
Descrição.......   : Remoção da obrigatoriedade de preenchimento do campo
                     "Número do Processo Judicial" na definição dos motivos
                     gerencial e oficial.
--------------------------------------------------------------------------------
                   VerificaPreenchimentoProcesso
Nº SOL:            250386/17325
Nº PPM             832403
Data da Alteração: 15/06/2015
Alteração Form:    Criação do campo "Indicativo de Pagamento em Juizo"
Responsável:       Higor Nayde Ferreira
Descrição:         Criação do campo "Indicativo de Pagamento em Juizo".
--------------------------------------------------------------------------------
Nº SOL............: 229881.16646 
Nº PPM............: 565996
Data da Alteração.: 02/10/2014
Alteração Form....: -
Responsável.......: Higor Nayde
Descrição.........: -
-------------------------------------------------------------------------------}


unit fCadRegSitFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, fCadastroMestreDetMT, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn,
  TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, wwdblook, Mask,
  TabControlDetalhe, ExtCtrls, DBCtrls, CMProcura, wwdbedit, TREdit, ImgList, DBClient,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, uCMClientDataSet, uCtrlRegSitFunc,
  uCtrlSitFunc, uCtrlMovContrCAGED, uCtrlMotivo, uCtrlPessoaFuncionario;

type
  TfrmCadRegSitFunc = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedMat: TwwDBEdit;
    Label6: TLabel;
    dbedNome: TwwDBEdit;
    dbtxtSituacao: TDBText;
    Label4: TLabel;
    dbedDatAlt: TCMDateTimePicker;
    Label7: TLabel;
    dblcSitFunc: TwwDBLookupCombo;
    Label2: TLabel;
    dblcMotivoOfic: TwwDBLookupCombo;
    Label3: TLabel;
    dblcMotivoGer: TwwDBLookupCombo;
    Label5: TLabel;
    dblcMovContrCAGED: TwwDBLookupCombo;
    CdsDet: TCMClientDataSet;
    CdsSitFunc: TCMClientDataSet;
    CdsMovContr: TCMClientDataSet;
    CdsMotivoGer: TCMClientDataSet;
    CdsMotivoOfi: TCMClientDataSet;
    grp: TGroupBox;
    cbxDataReintegra: TCMDateTimePicker;
    cbxDataRetorno: TCMDateTimePicker;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    edtNumetoProc: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure dblcSitFuncChange(Sender: TObject);
    procedure dblcMotivoOficChange(Sender: TObject);
    procedure dblcMotivoGerChange(Sender: TObject);
    procedure dblcMovContrCAGEDChange(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    //Início - Higor SOl 229881.16646 PPM 565996
    procedure edtNumetoProcKeyPress(Sender: TObject; var Key: Char);
    procedure cbxDataExit(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);   // William Santana - SOl 229881.16646 PPM 565996
    //Término - Higor SOl 229881.16646 PPM 565996
    procedure habilitaReintegracao;
  private
    CtrlRegSitFunc: TCtrlRegSitFunc;
    CtrlSitFunc: TCtrlSitFunc;
    CtrlMovContrCAGED: TCtrlMovContrCAGED;
    CtrlMotivo: TCtrlMotivo;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    procedure Sel(IdPessoa: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadRegSitFunc: TfrmCadRegSitFunc;

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadRegSitFunc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegSitFunc := TCtrlRegSitFunc.Create;
  CtrlRegSitFunc.InitializeAs(Padroes);
  CtrlRegSitFunc.CdsDet := CdsDet;

  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);

  CtrlMovContrCAGED := TCtrlMovContrCAGED.Create;
  CtrlMovContrCAGED.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);

  CdsSitFunc.Data := CtrlSitFunc.ListGeral(0, '', 'R,G');
  CdsMovContr.Data := CtrlMovContrCAGED.ListGeral;
  CdsMotivoOfi.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('A,D', '');
  CdsMotivoGer.Data := CdsMotivoOfi.Data;
end;

procedure TfrmCadRegSitFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRegSitFunc);
  FreeAndNil(CtrlSitFunc);
  FreeAndNil(CtrlMovContrCAGED);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmCadRegSitFunc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));

    if (Cds.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (Cds.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue
    else
      dbtxtSituacao.Font.Color := clTeal;
  end;
end;

procedure TfrmCadRegSitFunc.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
end;

procedure TfrmCadRegSitFunc.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegSitFunc.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRegSitFunc.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dbedDatAlt.CanFocus) then
    dbedDatAlt.SetFocus;
end;

procedure TfrmCadRegSitFunc.dblcSitFuncChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
    CdsDet.FieldByName('SITUACAO').asString := Trim(dblcSitFunc.Text);
end;

procedure TfrmCadRegSitFunc.dblcMotivoOficChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
    CdsDet.FieldByName('MOT_OFICIAL').asString := Trim(dblcMotivoOfic.Text);

 //Everson Cunha - SIG38475-84868 - Início

  habilitaReintegracao;  {

 //Início - William Santana SOl 229881.16646 PPM 565996
 if (((not CdsMotivoOfi.IsEmpty)  and (CdsMotivoOfi.fieldbyname('IDMOTIVO').AsString = '45'))
    or
    ((not CdsMotivoGer.IsEmpty)  and (CdsMotivoGer.fieldbyname('IDMOTIVO').AsString = '45'))) then
  begin
    edtNumetoProc.visible := true;
    Label8.visible := true;
    grp.visible := true;
    RgIndicativoPagamento.Visible := true;
  end else Begin
    grp.visible := false;
    Label8.visible := false;
    edtNumetoProc.visible := false;
    edtNumetoProc.Text := '';
    cbxDataReintegra.Text := '';
    cbxDataRetorno.Text := '';
    RgIndicativoPagamento.Visible := False;
    RgIndicativoPagamento.ItemIndex := -1;
 end;
 //Término - William Santana SOl 229881.16646 PPM 565996  }
 //Everson Cunha - SIG38475-84868 - Fim
end;

procedure TfrmCadRegSitFunc.dblcMotivoGerChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
    CdsDet.FieldByName('MOT_GERENCIAL').asString := Trim(dblcMotivoGer.Text);

  //Everson Cunha - SIG38475-84868 - Início

  habilitaReintegracao;  {

  //Início - Higor SOl 229881.16646 PPM 565996
 if (((not CdsMotivoGer.IsEmpty)  and (CdsMotivoGer.fieldbyname('IDMOTIVO').AsString = '45'))
     or
    ((not CdsMotivoOfi.IsEmpty)  and (CdsMotivoOfi.fieldbyname('IDMOTIVO').AsString = '45'))) then
  begin
    edtNumetoProc.visible := true;
    Label8.visible := true;
    grp.visible := true;
    RgIndicativoPagamento.Visible := true;
  end else Begin
    grp.visible := false;
    Label8.visible := false;
    edtNumetoProc.visible := false;
    edtNumetoProc.Text := '';
    cbxDataReintegra.Text := '';
    cbxDataRetorno.Text := '';
    RgIndicativoPagamento.Visible := true;
    RgIndicativoPagamento.ItemIndex := -1;
 end;
   //Término - Higor SOl 229881.16646 PPM 565996    }
   //Everson Cunha - SIG38475-84868 - Fim
end;

procedure TfrmCadRegSitFunc.dblcMovContrCAGEDChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
    CdsDet.FieldByName('MOVCONTRCAGED').asString := Trim(dblcMovContrCAGED.Text);

end;

procedure TfrmCadRegSitFunc.bbtnOkDetClick(Sender: TObject);
begin
  //Higor Nayde Ferreira Nº SOL: 250386/17325
  //Everson Cunha - SIG38475 - Ini
  {if RgIndicativoPagamento.ItemIndex = 0 then
     cdsDet.FieldByName('PAGTOJUIZO').AsString := 'S'
  else
  if RgIndicativoPagamento.ItemIndex = 1 then
     cdsDet.FieldByName('PAGTOJUIZO').AsString := 'N';}
  //Everson Cunha - SIG38475 - Fim

  //Higor Nayde Ferreira Nº SOL: 250386/17325
  if (Trim(dblcSitFunc.Text) = '') then
  begin
    MsgDlg('Informe a Situação Funcional.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dblcSitFunc.SetFocus;
    dblcSitFunc.DropDown; //Everson Cunha - SIG38475-84868
    abort; //Everson Cunha - SIG38475-84868
  end
  else
  if (CdsDet.FieldByName('DATASITFUNC').IsNull) then
  begin
    MsgDlg('Informe a Data de Alteração.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dbedDatAlt.SetFocus;
    abort; //Everson Cunha - SIG38475-84868
  end
  else
  //Início - Higor SOl 229881.16646 PPM 565996
  //Everson Cunha - SIG38475-84868 - Início
//  if (CdsMotivoGer.fieldbyname('IDMOTIVO').asstring = '45') or
//     (CdsMotivoOfi.fieldbyname('IDMOTIVO').asstring = '45') then
  if (CdsMotivoGer.fieldbyname('IDMOTIVO').AsInteger in [45, 86, 87]) or
     (CdsMotivoOfi.fieldbyname('IDMOTIVO').AsInteger in [45, 86, 87]) then
  //Everson Cunha - SIG38475-84868 - Fim
  begin
    //Cássio Rovaroto - SIG nº 38475.60439 - Início
    //if edtNumetoProc.Text = '' then begin
    //    MsgDlg('Preencha o número do processo', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    //    edtNumetoProc.SetFocus;
    //    exit;
    //end;
    //Cássio Rovaroto - SIG nº 38475.60439 - Fim
    if cbxDataReintegra.Text = '' then begin
        MsgDlg('Preencha a Data de Reintegração', 'Aviso', mtInformation, [mbOk], 0);
        cbxDataReintegra.SetFocus;
        exit;
    end;
    if cbxDataRetorno.Text = '' then begin  // Higor Nayde 229881/16646
        MsgDlg('Preencha a Data Efetiva de Retorno', 'Aviso', mtInformation, [mbOk], 0);
        cbxDataRetorno.SetFocus;
        exit;
    end;  // Higor Nayde 229881/16646
    if cds.FieldByName('DATADESLIGAMENTO').AsDateTime >  cbxDataReintegra.DateTime then begin
       MsgDlg('A data de Reintegração deve ser maior que a Data de Desligamento.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
       cbxDataReintegra.Clear;
       cbxDataReintegra.SetFocus;
       exit;
    end;
    //William Santana - SOL 229881.16646 PPM 565996
    if cbxDataReintegra.DateTime > cbxDataRetorno.DateTime then begin
       MsgDlg('A Data de Reintegração, deve ser menor ou igual a Data de Retorno ', 'Aviso', mtInformation, [mbOk], 0);
       cbxDataReintegra.Clear;
       cbxDataReintegra.SetFocus;
       exit;
    end;

     //Everson Cunha - SIG38475 - Ini
     {if RgIndicativoPagamento.ItemIndex = -1 then begin
       MsgDlg('Informe o Indicativo de Pagamento em Juízo.', 'Aviso', mtInformation, [mbOk], 0);
       exit;
     end;}
     //Everson Cunha - SIG38475 - Fim
    //William Santana - SOL 229881.16646 PPM 565996

  end;
  //Término - Higor SOl 229881.16646 PPM 565996
    inherited;

  bbtnVoltarDet.Click; //William Santana - SOL 229881.16646 PPM 565996
end;

procedure TfrmCadRegSitFunc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadRegSitFunc.Sel(IdPessoa: double);
begin
  //Início - William Santana SOl 229881.16646 PPM 565996
  //Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa);
  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,'F.IDPESSOA, F.MATRICULA, (''  '' || P.NOME) AS NOME, '+
                                                                  ' F.DATAADMISSAO, ST.TIPOSIT, F.IDEMPRESA,'+
                                                                  ' TO_CHAR(DECODE(ST.TIPOSIT,NULL,''Indefinida'','+
                                                                  ' TO_CHAR(DECODE(ST.TIPOSIT,''A'',''(Ativ'', ''F'',''(Afastad'', ''D'',''(Demitid'')) ||'+
                                                                  ' TO_CHAR(DECODE(PF.SEXO,''F'',''a)'',''o)'')))) AS SITUACAO, F.IDCARGO ,  '+
                                                                  ' F.DATADESLIGAMENTO');
  //Término - William Santana SOl 229881.16646 PPM 565996
  CdsDet.Data := CtrlRegSitFunc.ListHistSitFunc(IdPessoa);
end;

function TfrmCadRegSitFunc.GravarRegistro: boolean;
begin
  Result := CtrlRegSitFunc.Gravar;
  if not(Result) then
    raise exception.Create(CtrlRegSitFunc.MessageInfo);
end;

//Início - Higor SOl 229881.16646 PPM 565996


procedure TfrmCadRegSitFunc.edtNumetoProcKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9']) then
    Key := #0;
  inherited;
  // Higor Nayde 229881/16646
end;

//Término - Higor SOl 229881.16646 PPM 565996

//Início - William Santana - SOl 229881.16646 PPM 565996
procedure TfrmCadRegSitFunc.cbxDataExit(Sender: TObject);
begin
  inherited;
   if (cbxDataReintegra.Date > cbxDataRetorno.Date) and (cbxDataReintegra.text <> '') and  (cbxDataRetorno.text <> '')then begin
       MsgDlg('A Data de Reintegração, deve ser menor ou igual a Data de Retorno', 'Aviso', mtInformation, [mbOk], 0);
       (Sender as TCMDateTimePicker).Clear;
       (Sender as TCMDateTimePicker).SetFocus;
       exit;
   end;
end;
//Término - William Santana - SOl 229881.16646 PPM 565996

procedure TfrmCadRegSitFunc.sbtnAltDetClick(Sender: TObject);
begin
  //Everson Cunha - SIG38475 - Ini
  {if (cdsDet.FieldByName('PAGTOJUIZO').AsString = 'S') then
       RgIndicativoPagamento.ItemIndex := 0
  else  if (cdsDet.FieldByName('PAGTOJUIZO').AsString = 'N') then
       RgIndicativoPagamento.ItemIndex := 1
  else
       RgIndicativoPagamento.ItemIndex := -1;}
  //Everson Cunha - SIG38475 - Fim
  inherited;

end;

//Everson Cunha - SIG38475-84868 - Início
procedure TfrmCadRegSitFunc.habilitaReintegracao;
begin
  if (((not CdsMotivoOfi.IsEmpty)  and (CdsMotivoOfi.fieldbyname('IDMOTIVO').AsInteger in [45, 86, 87]))
    or
    ((not CdsMotivoGer.IsEmpty)  and (CdsMotivoGer.fieldbyname('IDMOTIVO').AsInteger in [45, 86, 87]))) then
  begin
    grp.Enabled := True;
    edtNumetoProc.Enabled := True;
    edtNumetoProc.Color := clWindow;
    cbxDataReintegra.Enabled := True;
    cbxDataReintegra.Color := clWindow;
    cbxDataRetorno.Enabled := True;
    cbxDataRetorno.Color := clWindow;
    //RgIndicativoPagamento.Enabled := True; //Everson Cunha - SIG38475
  end
  else
  Begin
    grp.Enabled := False;
    edtNumetoProc.Enabled := False;
    edtNumetoProc.Color := clSilver;
    cbxDataReintegra.Enabled := False;
    cbxDataReintegra.Color := clSilver;
    cbxDataRetorno.Enabled := False;
    cbxDataRetorno.Color := clSilver;
    //RgIndicativoPagamento.Enabled := False; //Everson Cunha - SIG38475

    edtNumetoProc.Text := '';
    cbxDataReintegra.Text := '';
    cbxDataRetorno.Text := '';
    //RgIndicativoPagamento.ItemIndex := -1; //Everson Cunha - SIG38475 

    if (CdsDet.State in [dsInsert,dsEdit]) then
    begin
      CdsDet.FieldByName('NUMPROCESSO').AsString := '';
      CdsDet.FieldByName('DATAREINT').AsString := '';
      CdsDet.FieldByName('DATARETORNO').AsString := '';
      //CdsDet.FieldByName('PAGTOJUIZO').AsString := ''; //Everson Cunha - SIG38475
    end;
  end;
end;
//Everson Cunha - SIG38475-84868 - Fim

end.
