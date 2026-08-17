{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÃO -------------------------------------
Nº SIG............: WO7144
Data da Alteração.: 09/02/2024
Responsável.......: Luis Ferrari
Descrição.........: Ajuste de retirada de validação de somente 3 periodos e dias de ferias para Estagiario, todas as regras somente Informativo para Registrados
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG............: 122537
Data da Alteração.: 03/03/2022
Responsável.......: Ewerton Beltramini
Descrição.........: Acrencentada uma variavel de controle para que algumas
                    criticas não tenham efeito para os casos de Matriculas
                    de funcionários cedidas.
--------------------------------------------------------------------------------
Nº SIG............: 114947
Data da Alteração.: 08/04/2021
Alteração Form....: dbedIniGozoExit
Responsável.......: edilaine
Descrição.........: não aplicar regras de data para estagiários
---------------------------------------------------------------------------------------------------------
Nº SIG............: 82785
Data da Alteração.: 14/02/2020
Alteração Form....: dbedIniAbono, dbedFimAbono, lblIniAbono, lblFimAbono
Responsável.......: Fabio Sampaio
Descrição.........: Implementação do período do abono
---------------------------------------------------------------------------------------------------------
Nº SIG............: 99768
Data da Alteração.: 19/05/2020
Responsável.......: Everson Cunha
Descrição.........: Criar marcação para receber ou não adiantamento do pagamento
                    de férias
--------------------------------------------------------------------------------
Nº SIG............: 78878
Data da Alteração.: 20/12/2019
Responsável.......: Everson Cunha
Descrição.........: Excepcionalizar a regra de mínimo 5 e 14 dias para
                    estagiários e cedidos
--------------------------------------------------------------------------------
Nº SIG............: SIG TIBERO
Data da Alteração.: 25/10/2018
Responsável.......: Everson Luiz Pereira da Cunha
Descrição.........: Alteração na função "avisos"
                    Modificando as comparações de datas de asString
                    para AsDateTime
--------------------------------------------------------------------------------
Nº SIG............: 65297
Data da Alteração.: 25/05/2018
Alteração Form....: CdsDetBeforeInsert, dbedFimGozoExit, sbtnAltDetClick,
                    bbtnOkDetClick
Responsável.......: Luiz Carlos
Descrição.........: Adequacao novas regras da CLT para ferias
--------------------------------------------------------------------------------
Nº SIG............: 73819
Data da Alteração.: 27/08/2018
Alteração Form....: (dfm) gbTotalDias, labDiasGozo
Responsável.......: Edilaine
Descrição.........: Adequacao novas regras da CLT para ferias
--------------------------------------------------------------------------------
Nº SIG............: 20674
Data da Alteração.: 20/09/2016
Alteração Form....: frmCadFerias
Responsável.......: Darivaldo Alencar
Descrição.........: Perda do período aquisitivo de férias. Conforme previsto
                    na legislação trabalhista, art. 133
--------------------------------------------------------------------------------
RESPONSÁVEL.: Higor Nayde Ferreira
Nº SOL......: 217671/16092
Nº KINTANA..: 396727
Data........: 12/09/2012
Descrição...: Criação de validação para pessoas menores de 18 anos
              e acima de 50 anos
--------------------------------------------------------------------------------}
unit fCadFerias;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  FCadastroMestreDetMT, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, TB97, Grids,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls, Mask, DBCtrls,
  TabControlDetalhe, wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList, DBClient, Spin,
  uCMClientDataSet, wwdbdatetimepicker, CMDateTimePicker, uCtrlFerias, uCtrlPessoaFuncionario,
  uCtrlGlobalRH, uCtrlAntec13, uCMTypes ;

type
  TfrmCadFerias = class(TFrmCadastroMestreDetMT)
    CdsDet: TCMClientDataSet;
    Label1: TLabel;
    dbedMat: TwwDBEdit;
    Label10: TLabel;
    dbedNome: TwwDBEdit;
    dbtxtSituacao: TDBText;
    CdsAntec13: TCMClientDataSet;
    dbrgProc: TDBRadioGroup;
    rgAdto13: TRadioGroup;
    rgFaltas: TRadioGroup;
    gbxGozo: TGroupBox;
    Label4: TLabel;
    dbedIniGozo: TCMDateTimePicker;
    dbedFimGozo: TCMDateTimePicker;
    spedDias: TSpinEdit;
    Label5: TLabel;
    labDiasGozo: TLabel;
    gbxAquisitivo: TGroupBox;
    dbedIniPeriodo: TCMDateTimePicker;
    Label3: TLabel;
    gbxAbono: TGroupBox;
    dbrgAbono: TDBRadioGroup;
    dbspedDiasAbono: TwwDBSpinEdit;
    lblDiasAbono: TLabel;
    gbxDescontos: TGroupBox;
    Label6: TLabel;
    dbspeParcFer: TwwDBSpinEdit;
    lblIndMesDevol: TLabel;
    dbspeIndMesDevol: TwwDBSpinEdit;
    dbedFimPeriodo: TCMDateTimePicker;
    Label8: TLabel;
    rbsAbono: TRadioButton;
    rbnAbono: TRadioButton;
    dbrgPerdaAfastamento: TDBRadioGroup;
    lbl1: TLabel;
    lbldias: TLabel;
    lblperiodo: TLabel;
    gbTotalDias: TGroupBox;
    Label7: TLabel;
    spedDiasTot: TSpinEdit;
    lblIniAbono: TLabel;
    lblFimAbono: TLabel;
    dbedIniAbono: TCMDateTimePicker;
    dbedFimAbono: TCMDateTimePicker;
    dbrgrpFlgPagtoAdto: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbrgAbonoChange(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbrgProcClick(Sender: TObject);
    procedure dbedFimGozoExit(Sender: TObject);
    procedure spedDiasExit(Sender: TObject);
    procedure CdsDetBeforeInsert(DataSet: TDataSet);
    procedure CdsDetAfterInsert(DataSet: TDataSet);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbedFimPeriodoExit(Sender: TObject);
    procedure dbedIniPeriodoExit(Sender: TObject);
    procedure rbsAbonoClick(Sender: TObject);
    procedure rbnAbonoClick(Sender: TObject);
    procedure dbspedDiasAbonoExit(Sender: TObject);
    procedure dbrgAbonoClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure dbrgPerdaAfastamentoClick(Sender: TObject);
    procedure dbedFimPeriodoChange(Sender: TObject);
    procedure dbedIniGozoExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure spedDiasTotExit(Sender: TObject);
    procedure dbrgrpFlgPagtoAdtoClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    //Darivaldo Alencar SIG 20674 -inicio
    dFimPeriodoFerias: TDate;
    iQtdeDiasAfastado: Integer;
    iQtdeDiasJaGozados : Integer;
    iQtdeDiasAbonoGozados: Integer;
    iQtdeDiasAGozar: Integer;
    bPerdaAfastamento: Boolean;
    //Darivaldo Alencar SIG 20674 -fim
    CtrlFerias: TCtrlFerias;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlAntec13: TCtrlAntec13;

    iProxNum, iNumDiasGozo, iNumDiasGozo3: integer;
    DatIni: TDateTime;
    bCedidos : Boolean;  //Ewerton Beltramini - 03/03/2022 - SIG 122537

    //Luiz Carlos - SIG65297 - Inicio
    totperiodo : Integer;
    //Luiz Carlos - SIG65297 - Fim
    procedure Sel(IdPessoa: double);
    function  GravarRegistro: boolean;
    procedure ValidaMenordeIdade;
    procedure avisos(seq : Integer);
    procedure labels;
    procedure AjustaValores;             //edilaine - SIG73819
    procedure HabilitaDesabilitaCampo; //Everson Cunha - SIG99768
  end;

var
  frmCadFerias: TfrmCadFerias;

implementation

uses uSistema, uMensErro, uDiasUteis, uCtrlPadroes, uModulo, uCtrlFuncoesRH,
  fPrincipal, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadFerias.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlAntec13 := TCtrlAntec13.Create;
  CtrlAntec13.InitializeAs(Padroes);

  CtrlFerias := TCtrlFerias.Create(Sistema.IdEmpresa, Sistema.UsaRAD, Sistema.IdUsuario);
  CtrlFerias.InitializeAs(Padroes);
  CtrlFerias.CdsFunc := Cds;
  CtrlFerias.CdsFerias := CdsDet;
  CtrlFerias.CdsAntec13 := CdsAntec13;

  CtrlGlobalRH.DbParamRH.LoadFromDb;
  if (CtrlGlobalRH.DbParamRH.FeriasIni.IsNull) or (CtrlGlobalRH.DbParamRH.FeriasFim.IsNull) then
    MsgDlg('Não Há Período Aberto para Cálculo de Férias.' +CR_LF+ 'Verifique Oportunamente',
           'Aviso', mtInformation, [mbOk,mbHelp], 0);

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

  rgFaltas.Visible := (CtrlFerias.IdRubricaFalta <> -1);

  lblIndMesDevol.Visible := (Modulo.IdContraCheque = FUNCEF);
  dbspeIndMesDevol.Visible := (Modulo.IdContraCheque = FUNCEF);

  if (Modulo.IdContraCheque = FUNCEF) then
  begin
    dbspeParcFer.MaxValue := 10;
    dbgrdDet.Selected.Add('INDMESDEVOL'+#9+'10'+#9+'Início Dev.Adto.'+#9+'F');
    //Darivaldo Alencar SIG20674 -inicio
    dbgrdDet.Selected.Add('FLGOCORRIDA'+#9+'10'+#9+'Processada?'+#9+'F');
    dbgrdDet.Selected.Add('FLGPERDAPERIODOAQUISITIVO'+#9+'10'+#9+'Perda por Afastamento?'+#9+'F');
    //Darivaldo Alencar SIG20674 -fim
    dbgrdDet.Update;
  end
  else
    dbspeParcFer.MaxValue := 20;

  //Darivaldo Alencar SIG 20674 -inicio
  dbrgAbono.left:= 300;
  dbrgPerdaAfastamento.ItemIndex:= 1;
  bPerdaAfastamento:= false;
  //Darivaldo Alencar SIG 20674 -fim

  sbtnProcurarClick(Sender);

  //Ewerton Beltramini - 03/03/2022 - SIG 122537 - Inicio:
  bCedidos := False;
  If POS('C', Cds.FieldByName('matricula').Value) > 0 then
     bCedidos := True;
  //Ewerton Beltramini - 03/03/2022 - SIG 122537 - Fim.


end;

procedure TfrmCadFerias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlAntec13);
  FreeAndNil(CtrlFerias);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmCadFerias.CmeCadastroFind(Sender: TObject);
begin
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
      dbtxtSituacao.Font.Color := clBlue;
  end
  else
  if not(Cds.Active) then
    Sel(-1);
end;

procedure TfrmCadFerias.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadFerias.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('INIPERIODOFERIAS').asDateTime := DatIni;
  CdsDet.FieldByName('FLGOCORRIDA').asInteger := 0;
  CdsDet.FieldByName('FLGABONO').asInteger  := 0;
  CdsDet.FieldByName('FIMPERIODOFERIAS').asDateTime := dFimPeriodoFerias;//Darivaldo Alencar SIG 20674
  CdsDet.FieldByName('FLGPERDAPERIODOAQUISITIVO').asInteger:= 0;//Darivaldo Alencar SIG 20674
end;

procedure TfrmCadFerias.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFerias.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    //edilane - SIG73819 - inicio
    {if (dbedIniPeriodo.CanFocus) then
      dbedIniPeriodo.SetFocus; }

    if spedDiasTot.CanFocus then
       spedDiasTot.SetFocus;
    //edilane - SIG73819 - fim
    

    if CdsAntec13.Locate('ANO',FU.ExtraiAno(dbedIniGozo.Date),[]) then
      //Dativaldo Alencar SIG 20674 -inicio
      //rgAdto13.ItemIndex := 0
      begin
         if (CdsDet.State = dsInsert) then
           rgAdto13.ItemIndex := 1
         else
           rgAdto13.ItemIndex := 0
      end
    else
    //Dativaldo Alencar SIG 20674 -fim
      rgAdto13.ItemIndex := 1;
  end;
end;

procedure TfrmCadFerias.CdsDetBeforeInsert(DataSet: TDataSet);
var
  iUltNum: integer;
  UltData, dtUltData: TDateTime;
begin
  inherited;
  CdsDet.First;

  //Luiz Carlos - SIG65297 - Inicio
  //CtrlFerias.FeriasFracionadas(CdsDet,CdsDet.FieldByName('qtdiasabono').asInteger,dbedIniPeriodo.Text,dbedIniGozo.text,dbedFimGozo.text); // FHBS SIG 20674
  CtrlFerias.VerificaFeriasFracionadas(CdsDet,dbedIniPeriodo.Text);

  iUltNum := CdsDet.FieldByName('NUMSEQ').asInteger;
  dtUltData := CdsDet.FieldByName('INIPERIODOFERIAS').asDateTime;
  CdsDet.Next;
  while not(CdsDet.EOF) do
  begin
    if (iUltNum < CdsDet.FieldByName('NUMSEQ').asInteger) then
      iUltNum := CdsDet.FieldByName('NUMSEQ').asInteger;

    if (dtUltData < CdsDet.FieldByName('INIPERIODOFERIAS').asDateTime) then
      dtUltData := CdsDet.FieldByName('INIPERIODOFERIAS').asDateTime;
    CdsDet.Next;
  end;
  CdsDet.Last;

  iProxNum := iUltNum + 1;
  UltData  := dtUltData;
  DatIni   := Cds.FieldByName('DATAADMISSAO').asDateTime;
  if not(CdsDet.IsEmpty) then
  begin
   if not(CtrlFerias.bFracionouFerias) then //Darivaldo Alencar  SIG 20674
     begin
        DatIni := UltData + 365;
        if (FU.ExtraiDia(UltData) <> FU.ExtraiDia(DatIni)) then
        begin
           DatIni := DatIni + 1;
           lbldias.Caption := '30' //Luiz Carlos - SIG65297
        end;
     end
   else
    DatIni := UltData;
  end;
  dFimPeriodoFerias :=  StrToDate(FU.IncData(DateToStr(DatIni), -1, 12, 0));//Darivaldo Alencar SIG 20674

  spedDiasTot.value := 0;    //edilaine - SIG73819

  avisos(1); //Luiz Carlos - SIG65297
end;

procedure TfrmCadFerias.CdsDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  spedDias.Value := 0;
  CdsDet.FieldByName('IDPESSOA').asInteger := Cds.FieldByName('IDPESSOA').asInteger;
  CdsDet.FieldByName('NUMSEQ').asInteger := iProxNum;
  CdsDet.FieldByName('INDMESDEVOL').asInteger := 0;
  if (Modulo.IdContraCheque = FUNCEF) then
  begin
    CdsDet.FieldByName('INDMESDEVOL').asInteger := 1;
    CdsDet.FieldByName('QTDPARCDEVOL').asInteger := 10;
    dbspeParcFer.Value := 10;
  end;
  if (Modulo.IdContraCheque in [REFER,SERPROS]) then
  begin
    CdsDet.FieldByName('QTDPARCDEVOL').asInteger := 6;
    dbspeParcFer.Value := 6;
  end;
  if not(Modulo.IdContraCheque in [REFER,SERPROS,FUNCEF]) then
  begin
    CdsDet.FieldByName('QTDPARCDEVOL').asInteger := 1;
    dbspeParcFer.Value := 1;
  end;
end;

procedure TfrmCadFerias.dbrgAbonoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) and (dbrgAbono.ItemIndex <> -1) then
  begin
    //dbspedDiasAbono.Visible := (dbrgAbono.ItemIndex = 0);//Darivaldo Alencar SIG 20674
    dbspedDiasAbono.enabled := (dbrgAbono.ItemIndex = 0);  //Darivaldo Alencar SIG 20674
    dbedIniAbono.Enabled    := (dbrgAbono.ItemIndex = 0); // Alterado por FHBS - 14/02/2020 - SIG82785
    dbedFimAbono.Enabled    := (dbrgAbono.ItemIndex = 0); // Alterado por FHBS - 14/02/2020 - SIG82785

    if (dbrgAbono.ItemIndex = 1) then
    begin
      dbspedDiasAbono.Color:= clScrollBar;//Darivaldo Alencar SIG 20674
      rbnAbono.Checked     := true;       //Darivaldo Alencar SIG 20674
      CdsDet.FieldByName('QTDIASABONO').asInteger := 0;

      // Alterado por FHBS - 14/02/2020 - SIG82785
      dbedIniAbono.Color:= clScrollBar;
      dbedFimAbono.Color:= clScrollBar;
      CdsDet.FieldByName('INIABONO').Clear;
      CdsDet.FieldByName('FIMABONO').Clear;
      // Fim - Alterado por FHBS - 14/02/2020 - SIG82785
    end
    else
    begin
      dbspedDiasAbono.Color:= clWindow;//Darivaldo Alencar SIG 20674
      rbsAbono.Checked     := true;    //Darivaldo Alencar SIG 20674

      dbedIniAbono.Color:= clWindow; // Alterado por FHBS - 14/02/2020 - SIG82785
      dbedFimAbono.Color:= clWindow; // Alterado por FHBS - 14/02/2020 - SIG82785

      //edilaine - SIG73819 - incio
      {if (spedDias.Value > 0) and
         (CdsDet.FieldByName('QTDIASABONO').asInteger = 0) then  // FHBS SIG 20674 - Para apenas quando for zero.
         CdsDet.FieldByName('QTDIASABONO').AsInteger := (spedDias.Value div 2); }

      if (spedDiasTot.value > 6) then
      begin
        CdsDet.FieldByName('QTDIASABONO').AsInteger := (spedDiasTot.Value div 3);
      end
      else if (spedDiasTot.text = '') or (spedDiasTot.value = 0) then
      begin
        MsgDlg('Favor preencher a quantidade de dias solicitados.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        spedDiasTot.SetFocus;
        Abort;
      end;
      //edilaine - SIG73819 - fim
    end;

    //Everson Cunha - SIG 99768 - Início
    
    HabilitaDesabilitaCampo;
    {
    // FHBS SIG 20674 - Inicio
    if ((spedDias.Value + dbspedDiasAbono.Value) < 15) then
    begin
      CdsDet.FieldByName('QTDPARCDEVOL').asInteger := 1;
      dbspeParcFer.Value := 1;
      dbspeParcFer.Enabled := false;
      dbspeParcFer.Color := clBtnFace;
    end
    else
    begin
      dbspeParcFer.Enabled := True;
      dbspeParcFer.Color := clWhite;
    end;
    // FHBS SIG 20674 - Fim
    }
    //Everson Cunha - SIG 99768 - Fim

    dbspedDiasAbonoExit(Sender); // Alterado por FHBS - 14/02/2020 - SIG82785
  end;
end;

procedure TfrmCadFerias.dbedFimGozoExit(Sender: TObject);
begin
  if (Trim(dbedFimGozo.Text) <> '') and (Trim(dbedIniGozo.Text) <> '') then
  begin
    iNumDiasGozo := DiasUteis.IntervaloDias(StrToDate(dbedIniGozo.Text),
      StrToDate(dbedFimGozo.Text))+1;
    if (Modulo.IdContraCheque = FUNCEF) then
    begin
      if (dbrgAbono.ItemIndex = 1) then
        iNumDiasGozo3 := iNumDiasGozo
      else
        iNumDiasGozo3 := iNumDiasGozo + Trunc(dbspedDiasAbono.value);     // Integer(Round(Int(iNumDiasGozo / 2)));}     //edilaine - SIG73819

      //Luiz Carlos - SIG65297 - inicio
      {if (iNumDiasGozo3 < 10) then
      begin
        if (MsgDlg('Número de Dias de Gozo menor que 10.'+CR_LF+
        'Confirma ?', 'Aviso', mtInformation, [mbYes,mbNo], 0) = mrNo) then
        begin
          dbedFimGozo.SetFocus;
          exit;
        end;
      end
      else
      }//Luiz Carlos - SIG65297 - fim

      //Everson Cunha - SIG99768 - Início

      HabilitaDesabilitaCampo;
      {
      if (iNumDiasGozo3 < 15) then
      begin
        CdsDet.FieldByName('QTDPARCDEVOL').asInteger := 1;
        dbspeParcFer.Value := 1;
        dbspeParcFer.Enabled := false;
        dbspeParcFer.Color := clBtnFace;
      end
      else
      begin
        dbspeParcFer.Enabled := true;
        dbspeParcFer.Color := clWhite;
      end;  }
      //Everson Cunha - SIG99768 - Fim
    end;

    spedDias.Value := iNumDiasGozo;
    spedDiasExit(self); //Everson Cunha - SIG78878
  end
  else
    spedDias.Value := 0;

  //dbrgAbonoChange(Sender);          //edilaine - SIG73819
end;

procedure TfrmCadFerias.spedDiasExit(Sender: TObject);
begin
  if (Trim(spedDias.Text) <> '') and (Trim(dbedIniGozo.Text) <> '') then
  begin
    if cmeDetalhe.Operacao = opAlterar then
       dbspedDiasAbono.Value := iNumDiasGozo3 - StrToInt(spedDias.Text) //edilaine - SIG82785
    else
       dbspedDiasAbono.Value := StrToInt(spedDiasTot.Text) - StrToInt(spedDias.Text); // Alterado por FHBS - 14/02/2020 - SIG82785

    if (Modulo.IdContraCheque = FUNCEF) then
    begin
      if (dbrgAbono.ItemIndex = 1) then
        iNumDiasGozo3 := spedDias.Value
      else
        iNumDiasGozo3 := spedDias.Value + dbspedDiasAbono.Field.Value;        //Integer(Round(Int(spedDias.Value / 2)))  //edilaine - SIG73819

      //if (spedDias.Value < 5)  {(iNumDiasGozo3 < 10)} then        //edilaine - SIG73819   //Everson Cunha - SIG78878
      if (spedDias.Value < 5) and (Cds.FieldByName('TIPOCONTRATO').AsString = 'E') then     //Everson Cunha - SIG78878
      begin
        MsgDlg('Número de Dias de Gozo menor que 5 dias.'+CR_LF+
               'Verifique !', 'Aviso', mtInformation, [mbOK], 0);
//        spedDias.SetFocus;
// WO7144 Ferrari        exit;
      end;
      //Everson Cunha - SIG99768 - Início

      HabilitaDesabilitaCampo;
      {
      else
      if (iNumDiasGozo3 < 15) then
      begin
        CdsDet.FieldByName('QTDPARCDEVOL').asInteger := 1;
        dbspeParcFer.Value := 1;
        dbspeParcFer.Enabled := false;
        dbspeParcFer.Color := clBtnFace;
      end
      else
      begin
        dbspeParcFer.Enabled := true;
        dbspeParcFer.Color := clWhite;
      end; }
      //Everson Cunha - SIG99768 - Fim
    end;

    CdsDet.FieldByName('FIMGOZOFERIAS').asDateTime :=
      StrToDate(dbedIniGozo.Text) + StrToInt(spedDias.Text) - 1;

    spedDiasTot.value := iNumDiasGozo3; //Everson Cunha - SIG78878

    // Alterado por FHBS - 14/02/2020 - SIG82785
    if (StrToInt(dbspedDiasAbono.Text) > 0) then
    begin
      CdsDet.FieldByName('INIABONO').asDateTime :=
        CdsDet.FieldByName('FIMGOZOFERIAS').asDateTime + 1;

      CdsDet.FieldByName('FIMABONO').asDateTime :=
        CdsDet.FieldByName('INIABONO').asDateTime + StrToInt(dbspedDiasAbono.Text) - 1;
    end
    else
    begin
      CdsDet.FieldByName('INIABONO').Clear;
      CdsDet.FieldByName('FIMABONO').Clear;
    end;
    // Fim - Alterado por FHBS - 14/02/2020 - SIG82785

  end
  else
    spedDias.Value := 0;

  //dbrgAbonoChange(Sender);      //edilaine - SIG73819
end;

procedure TfrmCadFerias.sbtnAlterarClick(Sender: TObject);
begin
  if (Cds.FieldByName('TIPOSIT').Value <> 'A') then
  begin
    if (MsgDlg('Situação Funcional Não Permite Gozo de Férias.'+CR_LF+
    'Confirma Alteração?', 'Aviso', mtInformation, [mbYes,mbNo], 0) = mrNo) then
    begin
      sbtnAlterar.Down := false;
      exit;
    end
    else
      sbtnAlterar.Down := false;
  end;

  inherited;
end;

procedure TfrmCadFerias.sbtnAltDetClick(Sender: TObject);
begin
  if (dbrgProc.ItemIndex = 0) then
  begin
    MsgDlg('Férias Processadas.'+CR_LF+
      'Alteração Não Permitida', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    sbtnAltDet.Down := false;
    exit;
  end;
  inherited;
  dbedFimGozoExit(Sender);

  bPerdaAfastamento:=  CdsDet.FieldByName('FLGPERDAPERIODOAQUISITIVO').asInteger = 1;//SIG 20674 Darivaldo Alencar

  //Luiz Carlos - SIG65297 - Inicio
  iQtdeDiasJaGozados := 0;
  iQtdeDiasAbonoGozados := 0;
  lbl1.Visible := True;
  lbldias.Visible := True;
  //lblperiodo.Visible := True; //Everson Cunha - SIG78878
  lblperiodo.Visible := Cds.FieldByName('TIPOCONTRATO').AsString = 'E';   //Everson Cunha - SIG78878
  avisos(0);
  //Luiz Carlos - SIG65297 - Fim

  //edilaine - SIG73819 - inicio
  spedDiasTot.value := Trunc(spedDias.value) + Trunc(dbspedDiasAbono.value);

  if CdsDet.FieldByName('FLGABONO').asInteger = 0 then
     dbrgAbono.ItemIndex := 1
  else
     dbrgAbono.ItemIndex := 0;
  dbrgAbonoChange(sender);
  //edilaine - SIG73819  - fim
  
end;

procedure TfrmCadFerias.dbrgProcClick(Sender: TObject);
begin
  if (CdsDet.FieldByName('FIMGOZOFERIAS').asDateTime > Date) and (dbrgProc.ItemIndex = 0) then
    if (MsgDlg('Férias normalmente são processadas na Geração da Folha.'+CR_LF+
               'Confirma Alteração?', 'Aviso', mtInformation,[mbYes,mbNo],0) = mrNo) then
      dbrgProc.ItemIndex := 1;
  inherited;
end;

procedure TfrmCadFerias.bbtnOkDetClick(Sender: TObject);
var
  bAchouAntec13: boolean;
  iNumDiasFalta: integer;
  AnoMes1, AnoMes2: string;
  somadias : Integer;
  //Luiz Carlos - SIG65297 - Inicio
  dias : Integer;
  v1 : Boolean;
  texto : string;
  //Luiz Carlos - SIG65297 - Fim
begin
  //FHBS SIG 20674 - inicio
  if (dbedIniPeriodo.Date > dbedFimPeriodo.Date) then
  begin
    MsgDlg('Incompatibilidade Entre as Datas para Férias.' +CR_LF+ 'Verifique.',
           'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbedFimPeriodo.SetFocus;
    Abort;
  end;
  //FHBS SIG 20674 - Fim

  if dbspedDiasAbono.Visible then
     somadias:= StrToInt(spedDias.Text)+StrToInt(dbspedDiasAbono.Text)
  else
     somadias:= StrToInt(spedDias.Text);

  //edilaine - SIG73819 - inicio
  AjustaValores();

  if (dbrgAbono.ItemIndex = 0) and (dbspedDiasAbono.value > 0) and ((spedDiasTot.text = '') or (spedDiasTot.value = 0)) then
  begin
    MsgDlg('Favor preencher a quantidade de dias solicitados.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    spedDiasTot.SetFocus;
    Abort;
  end;

  if (spedDiasTot.text <> '') and (spedDiasTot.value > 0) and (somadias <> spedDiasTot.value) then
  begin
    MsgDlg('A quantidade de dias solicitados não corresponde a soma dos dias de gozo e dias de abono.' +CR_LF+
           'Verifique.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    spedDiasTot.SetFocus;
    Abort;
  end;
  //edilaine - SIG73819 - fim


  //Higor Nayde Ferreira SOL.217671/16092
  //Luiz Carlos - SIG65297 - Inicio
  {if (CtrlFerias.NaoParcelarFeriasMenordeidade(CdsDet.FieldByName('IDPESSOA').AsFloat))and (somadias < 30) then begin
    MsgDlg('Parcelamento de férias não permitido - Empregado menor de 18 anos.','Aviso', mtInformation, [mbOk,mbHelp], 0);
    //CdsDet.FieldByName('QTDPARCDEVOL').AsString := '1';
    spedDias.SetFocus;
    exit
  end;
  if (CtrlFerias.ParcelarFeriasMaiordeidade(CdsDet.FieldByName('IDPESSOA').AsFloat))and (somadias < 30)then begin
     MsgDlg('Empregado maior de 50 anos, confirmar o parcelamento de férias?','Aviso', mtInformation, [mbOk,mbHelp], 0);
  end;
  //Higor Nayde Ferreira SOL.217671/16092
  }
  //Luiz Carlos - SIG65297 - Fim
  if (Modulo.IdContraCheque = FUNCEF) then
  begin
    //if (iNumDiasGozo3 > 14) and (dbspeParcFer.Value = 1) then                                      //Everson Cunha - SIG99768
    if (iNumDiasGozo3 > 14) and (dbspeParcFer.Value = 1) and (dbrgrpFlgPagtoAdto.ItemIndex = 0) then //Everson Cunha - SIG99768
    begin
      MsgDlg('Serão pagos apenas 70% do adiantamento de férias.',
        'Aviso', mtInformation, [mbOk,mbHelp], 0);
    end;

    //if (rgAdto13.ItemIndex = 0) and (FU.ExtraiDia(dbedIniGozo.Date) <> 1) then //Everson Cunha - SIG99768
    if (rgAdto13.ItemIndex = 0) and (FU.ExtraiMes(dbedIniGozo.Date) <> 1) then   //Everson Cunha - SIG99768
    begin
      MsgDlg('Solicitação de Adto 13º Salário Somente para Férias em Janeiro.',
        'Aviso', mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;
  end;

  if (CdsDet.FieldByName('INIPERIODOFERIAS').IsNull) then
  begin
    MsgDlg('Informe a Data de Início do Período Aquisitivo das Férias.',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbedIniPeriodo.SetFocus;
    exit;
  end;

  //Darivaldo Alencar SIG 20674 -inicio
  if (CdsDet.FieldByName('FIMPERIODOFERIAS').IsNull) then
   begin
        MsgDlg('Informe a Data Fim do Período Aquisitivo das Férias.',
        'Aviso',mtWarning,[mbOK],0);
        dbedFimPeriodo.setFocus;
        exit;
   end;
  //Darivaldo Alencar SIG 20674 -fim

  if (CdsDet.FieldByName('INIGOZOFERIAS').IsNull) then
  begin
    MsgDlg('Informe a Data de Início de Gozo das Férias.',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbedIniGozo.SetFocus;
    exit;
  end;

  if (CdsDet.FieldByName('FIMGOZOFERIAS').IsNull) then
  begin
    MsgDlg('Informe a Data Final de Gozo das Férias.',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dbedFimGozo.SetFocus;
    exit;
  end;


  if bCedidos then MsgDlg('Atenção:' +CR_LF+ 'Será Iguinorada a Incompatibilidade Entre as Datas das Férias para os Funcionários Cedidos.', 'Aviso', mtInformation, [mbOk], 0); //Ewerton Beltramini - 03/03/2022 - SIG 122537

  if (CdsDet.FieldByName('INIGOZOFERIAS').Value    > CdsDet.FieldByName('FIMGOZOFERIAS').Value) or
     //(CdsDet.FieldByName('INIPERIODOFERIAS').Value > CdsDet.FieldByName('INIGOZOFERIAS').Value)or                       //Ewerton Beltramini - 03/03/2022 - SIG 122537
     ((CdsDet.FieldByName('INIPERIODOFERIAS').Value > CdsDet.FieldByName('INIGOZOFERIAS').Value) and not (bCedidos) ) or  //Ewerton Beltramini - 03/03/2022 - SIG 122537
     (CdsDet.FieldByName('INIPERIODOFERIAS').AsDateTime > CdsDet.FieldByName('FIMPERIODOFERIAS').AsDateTime)//Darivaldo Alencar SIG 20674
     then
  begin
    MsgDlg('Incompatibilidade Entre as Datas para Férias' +CR_LF+ 'Verifique.',
      'Aviso', mtInformation, [mbOk,mbHelp], 0);
      dbedIniPeriodo.SetFocus;
    exit;
  end;

  CtrlFerias.FeriasFracionadas(CdsDet,CdsDet.FieldByName('qtdiasabono').asInteger,dbedIniPeriodo.Text,dbedIniGozo.text,dbedFimGozo.text); //Darivaldo Alencar SIG 20674

  if ((CdsDet.FieldByName('INIPERIODOFERIAS').Value + 365) >
       CdsDet.FieldByName('INIGOZOFERIAS').Value) then
    if (MsgDlg('Gozo das Férias Dentro do Período Aquisitivo.'+CR_LF+'Confirma?',
        'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
      exit;

  if ((StrToDate(FU.IncData(CdsDet.FieldByName('INIPERIODOFERIAS').asString,0,0,2))-spedDias.Value) <
      CdsDet.FieldByName('INIGOZOFERIAS').Value) then
    if (MsgDlg('Gozo das Férias além do Período Permitido.'+CR_LF+'Confirma?',
        'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
      exit;

  CdsDet.FieldByName('QTDIASGOZO').asInteger := spedDias.Value;
  //Darivaldo Alencar SIG 20674 -inicio
  //Data será calculada no componente dbedFimPeriodo.Date
  //CdsDet.FieldByName('FIMPERIODOFERIAS').asString := FU.IncData(
  //CdsDet.FieldByName('INIPERIODOFERIAS').asString, -1, 12, 0);
  //Darivaldo Alencar SIG 20674 -fim

  // Calcula Faltas
  if (rgFaltas.Visible) and (rgFaltas.ItemIndex < 2) then
  begin
    if (rgFaltas.ItemIndex = 0) then
    begin
      AnoMes1 := FU.RetornaAnoMes(StrToDate(dbedIniPeriodo.Text));
      AnoMes2 := FU.RetornaAnoMes(StrToDate(FU.IncData(dbedIniPeriodo.Text,0,11,0)));
    end
    else
    begin
      AnoMes2 := FU.RetornaAnoMes(StrToDate(dbedIniGozo.Text));
      AnoMes1 := FU.RetornaAnoMes(StrToDate(FU.IncData(dbedIniGozo.Text,0,-11,0)));
    end;

    iNumDiasFalta := CtrlFerias.GetTotalDeFaltas(StrToFloat(MontaSelect.ValoresChave[0]),
    AnoMes1, AnoMes2);

    if (iNumDiasFalta = 0) then
      MsgDlg('Não Há Dias de Falta no Período', 'Aviso', mtInformation, [mbOk,mbHelp], 0)
    else
      MsgDlg('Há ' +IntToStr(iNumDiasFalta)+ ' Dia(s) de Falta no Período.'+CR_LF+
             'Revise o Período de Gozo se Necessário.', 'Aviso',
             mtInformation, [mbOk,mbHelp], 0);
  end;

  //Luiz Carlos - SIG65297 - Inicio
  dias := 0;
  dias := dias + DiasUteis.IntervaloDias(CdsDet.FieldByName('INIGOZOFERIAS').AsDateTime,
                                         CdsDet.FieldByName('FIMGOZOFERIAS').AsDateTime) + 1;
  //Luiz Carlos - SIG65297 - Fim

   //Darivaldo Alencar SIG 20674
   iQtdeDiasJaGozados := CtrlFerias.GetDiasGozadosPeriodo(CdsDet,dbedIniPeriodo.text,1,CdsDet.FieldByName('NUMSEQ').asString);
   iQtdeDiasAbonoGozados := CtrlFerias.GetDiasGozadosPeriodo(CdsDet,dbedIniPeriodo.text,2,CdsDet.FieldByName('NUMSEQ').asString);

   if (CdsDet.state in [dsInsert,dsEdit]) then
     begin
       iQtdeDiasJaGozados:= iQtdeDiasJaGozados + spedDias.value;
       iQtdeDiasAbonoGozados:= iQtdeDiasAbonoGozados + Trunc(dbspedDiasAbono.value);
     end;

   //Luiz Carlos - SIG65297 - Inicio/Fim
   if ((iQtdeDiasJaGozados  > 30) or (spedDias.Value > 30)) or ((iQtdeDiasJaGozados + iQtdeDiasAbonoGozados) > 30) then
     begin
       MsgDlg('Não há saldo de dias de férias'+#13+
              'para o período informado, verifique!','Aviso',mtWarning,[mbOK],0);
       abort;
     end
   else
   {calcular saldo remanecente - segundo período}
   if (iQtdeDiasJaGozados > 0) then
   begin
     iQtdeDiasAGozar := 30 - (iQtdeDiasJaGozados + iQtdeDiasAbonoGozados);
     //Luiz Carlos - SIG65297 - Inicio
     totperiodo := 0;
     texto := '';
     if (iQtdeDiasAGozar >= 0) and (CtrlFerias.TotalFeriasPeriodo(CdsDet,CdsDet.FieldByName('INIPERIODOFERIAS').AsString) > 0) then
     begin
       if (CdsDet.State = dsInsert) then
         totperiodo := 1 + CtrlFerias.TotalFeriasPeriodo(CdsDet,CdsDet.FieldByName('INIPERIODOFERIAS').AsString)
       else
       begin
         totperiodo := CtrlFerias.TotalFeriasPeriodo(CdsDet,CdsDet.FieldByName('INIPERIODOFERIAS').AsString);
         texto      := CdsDet.FieldByName('NUMSEQ').asString;
       end;
{
//       if (totperiodo >= 1) and ((iQtdeDiasAGozar > 0) and (iQtdeDiasAGozar < 5)) then       // WO7144 Ferrari
       if (totperiodo >= 1) and ((iQtdeDiasAGozar > 0) and (iQtdeDiasAGozar < 5) and (cds.FieldByName('TIPOCONTRATO').AsString <> 'G')) then  // WO7144 Ferrari
       begin
         MsgDlg('Favor verificar os periodos lançados, pois o saldo'+#13+
                'de dias para o próximo periodo é inferior a 5 dias.','Aviso',mtWarning,[mbOK],0);
//         spedDias.SetFocus;
// WO7144 Ferrari         abort;
       end;

//       if totperiodo > 3 then    // WO7144 Ferrari
       if (totperiodo > 3) and (cds.FieldByName('TIPOCONTRATO').AsString <> 'G') then     // WO7144 Ferrari
       begin
         MsgDlg('Só é permitida a divisão em até três períodos'+#13+
                'de férias dentro do mesmo Período Aquisitivo.','Aviso',mtWarning,[mbOK],0);
//         spedDias.SetFocus;
// WO7144 Ferrari         abort;
       end;

       if (totperiodo = 3) and (iQtdeDiasAGozar > 0) and (cds.FieldByName('TIPOCONTRATO').AsString <> 'G') then
       begin
          MsgDlg('Existe saldo de dias a gozar e esse é'+#13+
                 'o último período aquisitivo. Favor verificar!','Aviso',mtWarning,[mbOK],0);
         spedDias.SetFocus;
// WO7144 Ferrari         abort;
       end;

       if not(CtrlFerias.QtdeDiasPeriodoAquisitivo(CdsDet,CdsDet.FieldByName('INIPERIODOFERIAS').AsString,dias,texto)) and
         //(iQtdeDiasJaGozados + iQtdeDiasAbonoGozados > 16) and ((iQtdeDiasAGozar >= 0) and (iQtdeDiasAGozar < 14)) or   //Everson Cunha - SIG78878
         (iQtdeDiasJaGozados + iQtdeDiasAbonoGozados > 16) and ((iQtdeDiasAGozar >= 0) and (iQtdeDiasAGozar < 14) and (Cds.FieldByName('TIPOCONTRATO').AsString = 'E')) or //Everson Cunha - SIG78878
         ((totperiodo = 3) and (iQtdeDiasJaGozados < 14))  then
         //((totperiodo = 3) and (iQtdeDiasJaGozados + iQtdeDiasAbonoGozados <= 15))  then
       begin
          MsgDlg('Não é permitida a divisão em mais um período'+#13+
                 'de férias devido aos períodos já lançados não'+#13+
                 'terem ao menos 14 dias de gozo.','Aviso',mtWarning,[mbOK],0);
         spedDias.SetFocus;
// WO7144 Ferrari         abort;
       end;
}
     end ;
//     else
{//     if ((iQtdeDiasAGozar > 0) and (iQtdeDiasAGozar < 5)) then         // WO7144 Ferrari
     if ((iQtdeDiasAGozar > 0) and (iQtdeDiasAGozar < 5) and (cds.FieldByName('TIPOCONTRATO').AsString <> 'G')) then        // WO7144 Ferrari
     begin
       MsgDlg('Favor verificar o periodo lançado, pois o saldo'+#13+
              'de dias para o próximo período é inferior a 5 dias.','Aviso',mtWarning,[mbOK],0);
       spedDias.SetFocus;
// WO7144 Ferrari       abort;
     end;
}
     //Luiz Carlos - SIG65297 - Fim
   end;
  //Darivaldo Alencar SIG 20674 -fim

  if (rgAdto13.ItemIndex = 0) then
  begin
    bAchouAntec13 := CdsAntec13.Locate('ANO',FU.ExtraiAno(dbedIniGozo.Date),[]);
    if not(bAchouAntec13) or
       ((bAchouAntec13) and (CdsAntec13.FieldByName('FLGOCORRIDA').asInteger = 0)) then
    begin
      if not(bAchouAntec13) then
        CdsAntec13.Insert
      else
        CdsAntec13.Edit;
      CdsAntec13.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
      CdsAntec13.FieldByName('MES').asInteger := FU.ExtraiMes(dbedIniGozo.Date);
      CdsAntec13.FieldByName('ANO').asInteger := FU.ExtraiAno(dbedIniGozo.Date);
      CdsAntec13.FieldByName('FLGOCORRIDA').asInteger := 0;
      CdsAntec13.Post;
    end;
  end;

  avisos(0); //Luiz Carlos - SIG65297
  inherited;

  // FHBS SIG 20674 - Início
//   //Darivaldo Alencar SIG 20674 -inicio
//   if (CdsDet.State = dsInsert) then
//     begin
//       rgFaltas.ItemIndex:= 0;
//     end;
//    //Darivaldo Alencar SIG 20674 -fim
  // FHBS SIG 20674 - Fim
end;

procedure TfrmCadFerias.bbtnConfirmarClick(Sender: TObject);
begin
  bbtnVoltarDet.Click;//Darivaldo Alencar SIG 20674
  inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadFerias.Sel(IdPessoa: double);
begin
  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
      '  F.IDPESSOA, F.MATRICULA, (''  '' || P.NOME) AS NOME,'+CR_LF+
      '  F.DATAADMISSAO, ST.TIPOSIT, F.IDEMPRESA, F.CODCENTROCUSTO,'+CR_LF+
      '  F.TIPOCONTRATO,'+CR_LF+       //Everson Cunha - SIG78878
      '  TO_CHAR(DECODE(ST.TIPOSIT,NULL,''Indefinida'','+CR_LF+
      '    TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
      '      ''A'',''(Ativ'','+CR_LF+
      '      ''F'',''(Afastad'','+CR_LF+
      '      ''D'',''(Demitid'')) ||'+CR_LF+
      '    TO_CHAR(DECODE(PF.SEXO,''F'',''a)'',''o)'')))) AS SITUACAO');

  CdsDet.Data := CtrlFerias.ListFerias(IdPessoa);
  CdsAntec13.Data := CtrlAntec13.ListAntecipacao13(CdsDet.FieldByName('IDPESSOA').asFloat);
end;

function TfrmCadFerias.GravarRegistro: boolean;
begin
  Result := CtrlFerias.Gravar;
  if (Result) then
  begin
    if (CtrlFerias.MessageInfo <> '') then
      MsgDlg(CtrlFerias.MessageInfo, 'Aviso', mtInformation, [mbOk, mbHelp], 0);
  end
  else
    MsgDlg(CtrlFerias.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);
end;

procedure TfrmCadFerias.ValidaMenordeIdade;
begin

end;

procedure TfrmCadFerias.dbedFimPeriodoExit(Sender: TObject);
begin
  //Darivaldo Alencar SIG 20674 -inicio
  if (dbedFimPeriodo.Text <> EmptyStr) and (dbedIniPeriodo.Text <> EmptyStr) then
  begin
    if (dbedFimPeriodo.Tag <> 1) and // FHBS SIG 20674 - Para controlar a mensagem de "Mantém alteração"
       (CdsDet.FieldByname('FIMPERIODOFERIAS').AsDateTime <> dFimPeriodoFerias) then
    begin
      dbedFimPeriodo.Tag := 1; // FHBS SIG 20674 - Para controlar a mensagem de "Mantém alteração"

      if (MsgDlg('Período Aquisitivo Fim é calculado automaticamente.'+#13+' Mantém alteração?','Aviso',mtConfirmation,[mbYes,mbNo],0) = idNo) then
        CdsDet.FieldByname('FIMPERIODOFERIAS').asDateTime := dFimPeriodoFerias
      else
      //FHBS SIG 20674 - inicio
      if (dbedIniPeriodo.Date > dbedFimPeriodo.Date) then
      begin
        MsgDlg('Incompatibilidade Entre as Datas para Férias.' +CR_LF+ 'Verifique.',
               'Aviso', mtInformation, [mbOk,mbHelp], 0);
        dbedFimPeriodo.SetFocus;
        Abort;
      end;
      //FHBS SIG 20674 - Fim
    end;
  end;
  // Darivaldo Alencar SIG 20674 - Fim
end;

procedure TfrmCadFerias.dbedIniPeriodoExit(Sender: TObject);
begin
  if (CdsDet.state in [dsInsert,dsEdit]) then
  begin
    CdsDet.FieldByName('FIMPERIODOFERIAS').AsString := FU.IncData(dbedIniPeriodo.Text, -1, 12, 0);
    dFimPeriodoFerias:= CdsDet.FieldByName('FIMPERIODOFERIAS').asDateTime;
  end;
end;

procedure TfrmCadFerias.rbsAbonoClick(Sender: TObject);
begin
 if (CdsDet.state in [dsInsert,dsEdit]) then
   CdsDet.FieldByName('FLGABONO').asInteger:= 1;
end;

procedure TfrmCadFerias.rbnAbonoClick(Sender: TObject);
begin
 if (CdsDet.state in [dsInsert,dsEdit]) then
   CdsDet.FieldByName('FLGABONO').asInteger:= 0;
end;

procedure TfrmCadFerias.dbspedDiasAbonoExit(Sender: TObject);
begin
  inherited;

  spedDias.Value := spedDiasTot.Value - dbspedDiasAbono.Field.Value;  //Everson Cunha - SIG78878

//  spedDiasExit(self);
end;

procedure TfrmCadFerias.dbrgAbonoClick(Sender: TObject);
begin
  inherited;
  //spedDiasExit(self);//Darivaldo Alencar SIG 20674
end;

procedure TfrmCadFerias.dbrgPerdaAfastamentoClick(Sender: TObject);
begin
  inherited;
  if (bPerdaAfastamento) then
    dbrgPerdaAfastamento.iTemIndex:= 0
  else dbrgPerdaAfastamento.iTemIndex:= 1;
end;

procedure TfrmCadFerias.sbtnInsDetClick(Sender: TObject);
begin
  CdsDet.First; // FHBS SIG 20674
  CtrlFerias.FeriasFracionadas(CdsDet,CdsDet.FieldByName('qtdiasabono').asInteger,dbedIniPeriodo.Text,dbedIniGozo.text,dbedFimGozo.text);

  inherited;

  if Cds.FieldByName('TIPOCONTRATO').AsString = 'E' then
  begin
    iQtdeDiasAfastado:= CtrlFerias.QtdeDiasAfastamento(CdsDet.FieldByName('IDPESSOA').AsFloat,
                                                       CdsDet.FieldByName('INIPERIODOFERIAS').AsDateTime,
                                                       CdsDet.FieldByName('FIMPERIODOFERIAS').AsDateTime);

    if (iQtdeDiasAfastado >= 180) then
    begin
      MsgDlg('Período aquisitivo recalculado '+#13+
             'devido afastamento igual ou superior a 180 dias!','Aviso',mtWarning,[mbOK],0);

      CdsDet.FieldByName('INIPERIODOFERIAS').AsDateTime := CtrlFerias.dDtRetorno;
      CdsDet.FieldByName('FIMPERIODOFERIAS').AsDateTime := StrToDate(FU.IncData(CdsDet.FieldByName('INIPERIODOFERIAS').AsString, -1, 12, 0));
      CdsDet.FieldByName('FLGPERDAPERIODOAQUISITIVO').asInteger := 1;
      dbrgPerdaAfastamento.ItemIndex:= 0;
      bPerdaAfastamento:= true;
    end
    else
    begin
      dbrgPerdaAfastamento.ItemIndex:= 1;
      bPerdaAfastamento:= false;
    end;

  end;

  // FHBS SIG 20674 - Início
   if (CdsDet.State = dsInsert) then
     rgFaltas.ItemIndex := 0;
  // FHBS SIG 20674 - Fim


  //Luiz Carlos - SIG65297 - Inicio
  lbl1.Visible := True;
  lbldias.Visible := True;
  //lblperiodo.Visible := True; //Everson Cunha - SIG78878
  lblperiodo.Visible := Cds.FieldByName('TIPOCONTRATO').AsString = 'E'; //Everson Cunha - SIG78878
  //Luiz Carlos - SIG65297 - Fim

  spedDiasTot.value := 0;     //edilaine - SIG73819

  dbrgrpFlgPagtoAdto.ItemIndex := 0; //Everson Cunha - SIG99768  
end;
//Darivaldo Alencar SIG 20674 -fim

procedure TfrmCadFerias.dbedFimPeriodoChange(Sender: TObject);
begin
  inherited;
  dbedFimPeriodo.Tag := 0; // FHBS SIG 20674 - Para controlar a mensagem de "Mantém alteração"
end;

procedure TfrmCadFerias.dbedIniGozoExit(Sender: TObject);
begin
  inherited;
  //Luiz Carlos - SIG65297 - Inicio
  if dbedIniGozo.Text <> '' then
  begin
  
    //edilaine SIG114947 : inicio
    if (cds.FieldByName('TIPOCONTRATO').AsString <> 'G') then
    begin
      if DiasUteis.Feriado(Sistema.IdEmpresa,dbedIniGozo.Date,True,True) then
      begin
        MsgDlg('Data informada é um Feriado.'+#13+
               '','Aviso',mtWarning,[mbOK],0);
//        dbedIniGozo.SetFocus;
// WO7144 Ferrari        Abort;
      end;

      if (DiasUteis.Feriado(Sistema.IdEmpresa,dbedIniGozo.Date + 1,True,True)) or (DiasUteis.Feriado(Sistema.IdEmpresa,dbedIniGozo.Date + 2,True,True)) then    begin
        MsgDlg('Data informada é próxima a um Feriado.'+#13+
               '','Aviso',mtWarning,[mbOK],0);
//        dbedIniGozo.SetFocus;
// WO7144 Ferrari        Abort;
      end;

      if not DiasUteis.DiaUtil(Sistema.IdEmpresa,dbedIniGozo.Date,true,true,false) then
      begin
        MsgDlg('Data informada é um Sábado/Domingo.'+#13+
               '','Aviso',mtWarning,[mbOK],0);
//        dbedIniGozo.SetFocus;
// WO7144 Ferrari        Abort;
      end;

      if not DiasUteis.DiaUtil(Sistema.IdEmpresa,dbedIniGozo.Date+1,true,true,false) then
      begin
        MsgDlg('Data informada é próxima a um fim de Semana.'+#13+
               '','Aviso',mtWarning,[mbOK],0);
//        dbedIniGozo.SetFocus;
// WO7144 Ferrari        Abort;
      end;
    end;
    //edilaine SIG114947 : fim

    //edilaine - SIG73819 - inicio
    if (spedDiasTot.text <> '') and (spedDiasTot.value > 0) then
    begin
      dbedFimGozo.Date := dbedIniGozo.Date + (spedDiasTot.value - CdsDet.FieldByName('QTDIASABONO').AsInteger) - 1;
      CdsDet.FieldByName('FIMGOZOFERIAS').asDateTime := dbedFimGozo.Date;
//      dbedFimGozoExit(sender);
    end;
    //edilaine - SIG73819 - fim

  end;
  //Luiz Carlos - SIG65297 - Fim
end;

procedure TfrmCadFerias.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  labels; //Luiz Carlos - SIG65297
end;

//Luiz Carlos - SIG65297 - Inicio
procedure TfrmCadFerias.avisos(seq : integer);
var
  texto : string;
begin
  case seq of
    0 : texto := CdsDet.FieldByName('NUMSEQ').asString;
    1 :
      begin
        texto := '';
        iQtdeDiasJaGozados := 0;
        iQtdeDiasAbonoGozados := 0;
      end;
    2 :
      begin
        lbldias.Visible    := False;
        lblperiodo.Visible := False;
        lbl1.Visible       := False;
      end;
    end;

  if (iQtdeDiasJaGozados = 0) and (iQtdeDiasAbonoGozados = 0) then
  begin
//    if (DatIni = 0) or (CdsDet.FieldByName('INIPERIODOFERIAS').AsString > DateTimeToStr(DatIni)) or (CdsDet.State = dsEdit) then //Everson Luiz - TIBERO
    if (DatIni = 0) or (CdsDet.FieldByName('INIPERIODOFERIAS').AsDateTime > DatIni) or (CdsDet.State = dsEdit) then                //Everson Luiz - TIBERO
    begin
      iQtdeDiasJaGozados    := CtrlFerias.GetDiasGozadosPeriodo(CdsDet,CdsDet.FieldByName('INIPERIODOFERIAS').AsString,1,texto);
      iQtdeDiasAbonoGozados := CtrlFerias.GetDiasGozadosPeriodo(CdsDet,CdsDet.FieldByName('INIPERIODOFERIAS').AsString,2,texto);
    end
    else
    begin
      iQtdeDiasJaGozados    := CtrlFerias.GetDiasGozadosPeriodo(CdsDet,DateTimeToStr(DatIni),1,texto);
      iQtdeDiasAbonoGozados := CtrlFerias.GetDiasGozadosPeriodo(CdsDet,DateTimeToStr(DatIni),2,texto);
    end;
  end;

  iQtdeDiasAGozar    := 30 - (iQtdeDiasJaGozados + iQtdeDiasAbonoGozados);

  lbldias.Caption    := IntToStr(iQtdeDiasAGozar);

  if iQtdeDiasAGozar < 17 then
    lblperiodo.Caption := 'Período de gozo não pode ser inferior a 5 dias'
  else
  if iQtdeDiasAGozar = 0 then
    lblperiodo.Caption := ''
  else
    lblperiodo.Caption := 'Não identificado lançamento de período com pelo menos 14 dias';
end;
//Luiz Carlos - SIG65297 - Fim

procedure TfrmCadFerias.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  avisos(1); //Luiz Carlos - SIG65297
end;

procedure TfrmCadFerias.labels;
begin
  //Luiz Carlos - SIG65297 - Inicio
  lblperiodo.Visible := False;
  lblperiodo.Caption := 'Não identificado lançamento de período com pelo menos 14 dias';
  lbl1.Visible := False;
  lbldias.Visible := False;
  lbldias.Caption := '30';
  iQtdeDiasAGozar := 0;
  //Luiz Carlos - SIG65297 - Fim
end;

procedure TfrmCadFerias.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  avisos(2);
end;

procedure TfrmCadFerias.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  avisos(2);
end;

//edilaine - SIG73819 - inicio
procedure TfrmCadFerias.spedDiasTotExit(Sender: TObject);
var
  iDiasSaldo : integer;
begin
  inherited;

  iDiasSaldo := StrToIntDef(lbldias.caption,0);

  if (bbtnCancelarDet.Focused) or (bbtnVoltarDet.focused) then
     abort;
                        
  if bCedidos then MsgDlg('Será Iguinorada a quantidade de dias solicitados maiores que o saldo de dias do período para os Funcionários Cedidos.','Aviso',mtInformation,[mbOK],0);  //Ewerton Beltramini - 03/03/2022 - SIG 122537

  //if (Trunc(spedDiasTot.value) > iDiasSaldo) then                       //Ewerton Beltramini - 03/03/2022 - SIG 122537
  if (Trunc(spedDiasTot.value) > iDiasSaldo) and not (bCedidos)then       //Ewerton Beltramini - 03/03/2022 - SIG 122537
  begin
    MsgDlg('A quantidade de dias solicitados não pode ser maior que saldo de dias do período.'+#13+
           'Favor ajustar!','Aviso',mtWarning,[mbOK],0);
    spedDiasTot.SetFocus;
    Abort;
  end;

  if (spedDiasTot.value > 6) and(dbspedDiasAbono.Visible) and (dbrgAbono.ItemIndex = 0) then
     CdsDet.FieldByName('QTDIASABONO').AsInteger := (spedDiasTot.Value div 3);
// WO7144 Ferrari
//  if (dbedIniGozo.text <> '') and (dbedFimGozo.text = '') then
//     dbedIniGozoExit(dbedIniGozo);

  spedDias.Value := spedDiasTot.Value - dbspedDiasAbono.Field.Value; //Everson Cunha - SIG78878

end;


procedure TfrmCadFerias.AjustaValores;
begin
  {ajusta fim do gozo}
  if (dbedIniGozo.text <> '') and (spedDiasTot.value > 0) and (dbedFimGozo.text = '') then
  begin
    dbedIniGozoExit(dbedIniGozo);
    abort;
  end;

  {ajusta dias de gozo}
  if (dbedIniGozo.text <> '') and (dbedFimGozo.text <> '') and (spedDias.value = 0) then
  begin
    dbedIniGozoExit(dbedIniGozo);
    dbedFimGozoExit(dbedFimGozo);
    abort;
  end;

  {ajusta abono}
  if (dbspedDiasAbono.Visible) and (dbrgAbono.ItemIndex = 0) then
  begin
    if ((dbspedDiasAbono.text = '') or (dbspedDiasAbono.value = 0)) and (spedDiasTot.value > 0) then
       spedDiasTotExit(spedDiasTot);
  end;

end;
//edilaine - SIG73819 - fim

procedure TfrmCadFerias.dbrgrpFlgPagtoAdtoClick(Sender: TObject);
begin
  inherited;
  //Everson Cunha - SIG99768 - Início
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    if dbrgrpFlgPagtoAdto.ItemIndex = 1 then
      if (MsgDlg('O adiantamento não será processado na Folha de Férias.'+CR_LF+'Confirma?',
          'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        dbrgrpFlgPagtoAdto.ItemIndex := 0;
  end;

  HabilitaDesabilitaCampo;
  
  //Everson Cunha - SIG99768 - Fim
end;

procedure TfrmCadFerias.HabilitaDesabilitaCampo;
begin
  if (dbrgrpFlgPagtoAdto.ItemIndex = 1) then
  begin
    //Quant. Parc. Desc.
    CdsDet.FieldByName('QTDPARCDEVOL').asInteger := 0;
    dbspeParcFer.Value := 0;
    dbspeParcFer.Enabled := false;
    dbspeParcFer.Color := clBtnFace;

    //Início Dev.Adto.
    CdsDet.FieldByName('INDMESDEVOL').asInteger := 1;
    dbspeIndMesDevol.Value := 1;
    dbspeIndMesDevol.Enabled := false;
    dbspeIndMesDevol.Color := clBtnFace;
  end
  else
  if (spedDiasTot.Value < 15) then
  begin
    //Quant. Parc. Desc.
    CdsDet.FieldByName('QTDPARCDEVOL').asInteger := 1;
    dbspeParcFer.Value := 1;
    dbspeParcFer.Enabled := false;
    dbspeParcFer.Color := clBtnFace;

    //Início Dev.Adto.
    dbspeIndMesDevol.Enabled := True;
    dbspeIndMesDevol.Color := clWindow;
  end
  else
  begin
    //Quant. Parc. Desc.
    CdsDet.FieldByName('QTDPARCDEVOL').asInteger := 1;
    dbspeParcFer.Value := 1;
    dbspeParcFer.Enabled := True;
    dbspeParcFer.Color := clWindow;

    //Início Dev.Adto.
    dbspeIndMesDevol.Enabled := True;
    dbspeIndMesDevol.Color := clWindow;
  end;
end;

procedure TfrmCadFerias.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  //Ewerton Beltramini - 03/03/2022 - SIG 122537 - Inicio:
  bCedidos := False;
  If POS('C', Cds.FieldByName('matricula').Value) > 0 then
     bCedidos := True;
  //Ewerton Beltramini - 03/03/2022 - SIG 122537 - Fim.

end;

end.
