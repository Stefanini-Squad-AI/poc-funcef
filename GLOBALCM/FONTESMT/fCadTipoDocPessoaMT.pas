// ATUALIZAÇÕES
{--------------------------------------------------------------------------------------------------
Nº SIG......: 22093
Data........: 22/08/2016
Responsável.: Michelle Suellyn Mota/Darivaldo Alencar
Descrição...: Criar campo para NIF no Consulta geral de pessoas e na tela elegível participante
Alterações..: Criação de novo grid, alinhamento de campos, novas funcionalidades para manipulação
das informações desse grid, nova imagelist. Componentes novos: GridExibeObriga, ImageListApoiaGrid.
--------------------------------------------------------------------------------------------------
Nº SOL......: 250389/17574
Nº KINTANA..: 992385
Data........: 05/08/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Criação de flg para primeira habilitação e categoria
Alterações DFM: Criação dos checkBoxs primeira habilitação e categoria
--------------------------------------------------------------------------------------------------
Rotina......: chkFlagMultiplaMascara e CMEDetalhe
Nº SOL......: 138283
Nº KINTANA..: 840489
Data........: 30/06/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Foram criadas as rotinas para o cadastro de mais de uma mascara por documento.
Alterações DFM: Criação do checkBox para selecão de multiplasmacaras, criação dos componentes para
				coontrole do detalhe.
-------------------------------------------------------------------------------------------------- }
unit fCadTipoDocPessoaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, ExtCtrls, DBCtrls, wwdblook, Mask, wwdbedit,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, uCtrlTipoDocPessoa, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  TabControlDetalhe,uCmTypes,uAutorizacao, uCmSqlParams, DBGrids, DBGrid2,
  DBTables, Provider;
  //Vinicius Maciel SOL138283 Kintana 840489 - uCMTypes e uAutorizacao

type
  TfrmCadTipoDocPessoa = class(TFrmCadastroMT)
    Label3: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbedNomeDoc: TwwDBEdit;
    dbedMascara: TwwDBEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    dbRdAplica: TDBRadioGroup;
    CdsRegra: TCMClientDataSet;
	//Vinicius Maciel SOL138283 Kintana 840489
    CmeDetalhe: TCmEventosCadastro;
    tbcDetalhe: TTabControlDetalhe;
    pnlControlesDet: TPanel;
    lbNome: TLabel;
    lbMascara: TLabel;
    dbgrdDet: TwwDBGrid;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    cdsDet: TCMClientDataSet;
    dsDet: TwwDataSource;
    dbedNomeTipo: TwwDBEdit;
    dbedMultiplasMascaras: TwwDBEdit;
    chkFlagMultiplaMascara: TDBCheckBox;
    dbchkIdent: TDBCheckBox;
    ImageListApoiaGrid: TImageList;
    GridExibeObriga: TStringGrid;
	//Vinicius Maciel SOL138283 Kintana 840489 - Fim
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbedMascaraKeyPress(Sender: TObject; var Key: Char);
    //Vinicius Maciel SOL138283 Kintana 840489
   procedure chkFlagMultiplaMascaraClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FazerVoltarDet;
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
    function  VerificaMestre: boolean;
    procedure desativaDetalhe;
    procedure ativaDetalhe;
    procedure sbtnApagarClick(Sender: TObject); // Michelle Mota - SIG 22093
    procedure GridExibeObrigaDrawCell(Sender: TObject; ACol, ARow: Integer; // Michelle Mota - SIG 22093
      Rect: TRect; State: TGridDrawState);   // Michelle Mota - SIG 22093
    procedure GridExibeObrigaClick(Sender: TObject); // Michelle Mota - SIG 22093
    procedure sbtnProcurarClick(Sender: TObject);  // Michelle Mota - SIG 22093
    procedure AtualizaGridExibeObriga;// Michelle Mota - SIG 22093
    procedure bbtnConfirmarClick(Sender: TObject); // Michelle Mota - SIG 22093
	//Vinicius Maciel SOL138283 Kintana 840489 - Fim

  private
    { Private declarations }
  public
    { Public declarations }
    TipoDocPessoa: TCtrlTipoDocPessoa;
    procedure Seleciona( IdTipoDocPessoa: Double = 0 );
    procedure SelecionaMascaras( IdTipoDocPessoa: Double = 0 );//Vinicius Maciel SOL138283 Kintana 840489
    procedure ExcluirMascaras; // Michelle Mota - SIG 22093
  end;

var
  frmCadTipoDocPessoa: TfrmCadTipoDocPessoa;
  valor : Integer; // Michelle Mota - SIG 22093
  aValor : array of array of Integer; // Michelle Mota - SIG 22093

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TfrmCadTipoDocPessoa.Seleciona( IdTipoDocPessoa: Double );
var
  i, j : Integer;
  R : TRect;
begin
  cds.Data := TipoDocPessoa.ListaTipoDocPessoa( IdTipoDocPessoa );
  SelecionaMascaras(IdTipoDocPessoa);//Vinicius Maciel SOL138283 Kintana 840489
  {Início - Michelle Mota - SIG 22093}
  SetLength(aValor, 7, 2);
  for i := 0 to 6 do
    for j := 0 to 1 do
      aValor[i,j] := 0;
  {Término - Michelle Mota - SIG 22093}
end;

procedure TfrmCadTipoDocPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  TipoDocPessoa := TCtrlTipoDocPessoa.Create;
  TipoDocPessoa.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  TipoDocPessoa.cds := cds;
  TipoDocPessoa.cdsDet := cdsDet;//Vinicius Maciel SOL138283 Kintana 840489
  Seleciona( -1 );
  desativaDetalhe;//Darivaldo Alencar SIG 22093
  CdsRegra.Data := TipoDocPessoa.GetDataPacket( 'SELECT IDREGRA, NOMEREGRA FROM REGRA'{ivlm} );
end;

procedure TfrmCadTipoDocPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TipoDocPessoa.Free;
end;

procedure TfrmCadTipoDocPessoa.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
end;

procedure TfrmCadTipoDocPessoa.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  cds.DisableControls;
  //Vinicius Maciel SOL138283 Kintana 840489
  TipoDocPessoa.deletaFilho(cdsDet.FieldByName('IDDOCUMENTO').asString);
  cdsDet.EmptyDataSet;
  //Vinicius Maciel SOL138283 Kintana 840489 - FIM
  Accept := TipoDocPessoa.Gravar;
  cds.EnableControls;
end;

procedure TfrmCadTipoDocPessoa.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  cds.DisableControls;
  Accept := TipoDocPessoa.Gravar;
  cds.EnableControls;
end;

procedure TfrmCadTipoDocPessoa.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  cds.DisableControls;
  Accept := TipoDocPessoa.Gravar;
  cds.EnableControls;
end;

procedure TfrmCadTipoDocPessoa.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ( dbedNomeDoc.text <> '' );
  //if chkFlagMultiplaMascara.checked then
  //cdsDet.ApplyUpdates(0);
  If Not Accept Then
     MsgDlg( 'Preencha Nome do Documento', LerMensagem(2), mtWarning, [mbOk], 0 );
end;

procedure TfrmCadTipoDocPessoa.CmeCadastroEdit(Sender: TObject);
begin
  {O procedimento abaixo corrige o erro de ele pressionar o botão alterar pela
  segunda vez e não carregar as alterações da segunda vez do Cds}
//Vinicius Maciel SOL138283 Kintana 840489
  IF MontaSelect.RetornouValor Then
  Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
  inherited;


  dbedNomeDoc.SetFocus;

  If cds.FieldByName( 'FLGOBRIGAVALIDADE'{ivlm} ).IsNull Then
     cds.FieldByName( 'FLGOBRIGAVALIDADE'{ivlm} ).AsString := 'N'{ivlm};
end;

procedure TfrmCadTipoDocPessoa.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  SelecionaMascaras(-1);//Vinicius Maciel SOL138283 Kintana 840489
  With cds Do Begin
       FieldByName( 'DOCCHAVE'{ivlm} ).AsString       := 'N'{ivlm};
       FieldByName( 'OBRIGAUF'{ivlm} ).AsString       := 'N'{ivlm};
       FieldByName( 'OBRIGAORGAO'{ivlm} ).AsString    := 'N'{ivlm};
       FieldByName( 'OBRIGAEMISSAO'{ivlm} ).AsString  := 'N'{ivlm};
       FieldByName( 'FISICAJURIDICA'{ivlm} ).AsString := 'F'{ivlm};
       FieldByName( 'FLGOBRIGAVALIDADE'{ivlm} ).AsString := 'N'{ivlm};
       //Vinicius Maciel SOL138283 Kintana 840489
       FieldByName( 'FLGMULTIPLAMASCARA' ).AsString := 'N'{ivlm};
       //Vinicius Maciel SOL138283 Kintana 840489 - Fim

       //Higor Nayde Nº SOL250389/17574 NºPPM992385
       FieldByName( 'OBRIGAPRMHAB' ).AsString := 'N';
       FieldByName( 'OBRIGACATG' ).AsString := 'N';
       //Higor Nayde Nº SOL250389/17574 NºPPM992385

       {Início - Michelle Mota - SIG 22093}
       FieldByName( 'EXIBEUF' ).AsString := 'N';
       FieldByName( 'EXIBEORGAO' ).AsString := 'N';
       FieldByName( 'EXIBEEMISSAO' ).AsString := 'N';
       FieldByName( 'EXIBEVALIDADE' ).AsString := 'N';
       FieldByName( 'EXIBEPRMHAB' ).AsString := 'N';
       FieldByName( 'EXIBECATG' ).AsString := 'N';
       FieldByName( 'EXIBEPAIS' ).AsString := 'N';
       FieldByName( 'OBRIGAPAIS' ).AsString := 'N';
       {Término - Michelle Mota - SIG 22093}
  End;

  dbedNomeDoc.SetFocus;
end;

procedure TfrmCadTipoDocPessoa.dbedMascaraKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //Vinicius Maciel SOL138283 Kintana 840489
  If  ( ( key = '.'{ivlm} ) and ( Copy( {dbedMascara}TwwDBEdit(Sender).Text, Length( {dbedMascara}TwwDBEdit(Sender).Text ), 1 ) = '.'{ivlm} ) ) Or
          ( ( key = '-'{ivlm} ) and ( Copy( {dbedMascara}TwwDBEdit(Sender).Text, Length( {dbedMascara}TwwDBEdit(Sender).Text ), 1 ) = '-'{ivlm} ) ) Or
          ( ( key = '/'{ivlm} ) and ( Copy( {dbedMascara}TwwDBEdit(Sender).Text, Length( {dbedMascara}TwwDBEdit(Sender).Text ), 1 ) = '/'{ivlm} ) ) Then Begin
    //Vinicius Maciel SOL138283 Kintana 840489 - Fim
	 MessageBeep(0);
      ShowMessage(Translate('Máscara Inválida'));
      key := #0;
  End Else
  If Not ( key In [ ' '{ivlm}, '9'{ivlm}, '.'{ivlm}, '#'{ivlm}, '-'{ivlm}, '/'{ivlm}, #8 ] ) Then Begin
     MessageBeep(0);
     ShowMessage(Translate('Máscara Inválida'));
     key := #0;
     Exit;
  End Else
  If ( Not ( key In [ '9'{ivlm}, '#'{ivlm} ] ) ) and ( Length( {dbedMascara}TwwDBEdit(Sender).Text ) = 0 ) Then Begin//Vinicius Maciel SOL138283 Kintana 840489
     MessageBeep(0);
     ShowMessage(Translate('Máscara Inválida'));
     key := #0;
  end;
end;

//Vinicius Maciel SOL138283 Kintana 840489

procedure TfrmCadTipoDocPessoa.SelecionaMascaras( IdTipoDocPessoa: Double );
begin
  cdsDet.Data := TipoDocPessoa.RecuperaMascaras (IdTipoDocPessoa);
end;

procedure TfrmCadTipoDocPessoa.ativaDetalhe ();
begin
    dbedMascara.Enabled:=false;
    dbedMascara.Color:= clScrollBar;
    dbedMascara.Clear;
    tbcDetalhe.Enabled:=true;
    dbgrdDet.Color:=clWindow;

    //Darivaldo Alencar SIG 22093 -SIG 22093 -inicio
    sbtnAltDet.Enabled:= not cdsDet.isEmpty;
    sbtnExcluiDet.Enabled:= not cdsDet.isEmpty;
    sbtnInsDet.Enabled:= True;
    bbtnOkDet.visible:= (sbtnInsDet.Down) or (sbtnAltDet.Down);
    bbtnCancelarDet.visible:= (sbtnInsDet.Down) or (sbtnAltDet.Down);
    bbtnVoltarDet.visible:= (sbtnInsDet.Down) or (sbtnAltDet.Down);
    //Darivaldo Alencar SIG 22093 -SIG 22093 -Fim
end;

procedure TfrmCadTipoDocPessoa.desativaDetalhe ();
begin
    dbedMascara.Enabled:=enabled;
    dbedMascara.Color:=clWindow;
    tbcDetalhe.Enabled:=false;
    dbgrdDet.Color:=clScrollBar;

    //Darivaldo Alencar SIG 22093 -SIG 22093 -inicio
    sbtnAltDet.Enabled:= not cdsDet.isEmpty;
    sbtnExcluiDet.Enabled:= not cdsDet.isEmpty;
    sbtnInsDet.Enabled:= (sbtnInsDet.Down) or (sbtnAltDet.Down);
    bbtnOkDet.visible:= False;
    bbtnCancelarDet.visible:= (sbtnInsDet.Down) or (sbtnAltDet.Down);
    bbtnVoltarDet.visible:= (sbtnInsDet.Down) or (sbtnAltDet.Down);
    //Darivaldo Alencar SIG 22093 -SIG 22093 -Fim
end;

procedure TfrmCadTipoDocPessoa.chkFlagMultiplaMascaraClick(
  Sender: TObject);
begin
  inherited;
    if chkFlagMultiplaMascara.checked then
    begin
      ativaDetalhe;
      if ds.State in ([dsInsert, dsEdit]) then
      Cds.FieldByName('MASCARA').asString:='';
    end
    else
        if not chkFlagMultiplaMascara.Checked then
        begin
          if ds.State in ([dsInsert, dsEdit]) then
          begin
              if not CdsDet.IsEmpty then
              begin
                  //if (MsgDlg('Existem Máscaras Cadastradas, deseja realmente sair?', 'Atenção', mtConfirmation, [mbYes,mbNo],0) = mrYes) then // Michelle Mota - SIG 22093
                  if (MsgDlg('Existem Máscaras cadastradas,'+#13+ ' deseja realmente excluir?', 'Atenção', mtConfirmation, [mbYes,mbNo],0) = mrYes) then // Michelle Mota - SIG 220933
                  begin
                      //CdsDet.EmptyDataSet; -- não funciona - Michelle Mota - SIG 22093
                      desativaDetalhe;
                      ExcluirMascaras;// Michelle Mota - SIG 22093
                  end
                  else
                     chkFlagMultiplaMascara.Checked := true;
                  end;
              end;
                 // desativaDetalhe; //Darivaldo Alencar SIG 22093
    end;
end;

procedure TfrmCadTipoDocPessoa.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  if sbtnInsDet.Down then
  begin
       dbgrdDet.SendToBack;
       tb97Detalhe.Visible := true;
       CmeDetalhe.Insert(Self);
       CmeDetalhe.Atualizabotoes(Self);
       CmeDetalhe.Operacao := OpInserir;
       ativaDetalhe;//Darivaldo Alencar SIG 22093
  end
  else
      sbtnInsDet.Down := true;
    
end;

procedure TfrmCadTipoDocPessoa.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if sbtnAltDet.Down then
  begin
       dbgrdDet.SendToBack;
       tb97Detalhe.Visible := true;
       CmeDetalhe.Edit(Self);
       CmeDetalhe.Atualizabotoes(Self);
       CmeDetalhe.Operacao := OpAlterar;
       ativaDetalhe;//Darivaldo Alencar SIG 22093
  end
  else
      sbtnAltDet.Down := true;
end;

procedure TfrmCadTipoDocPessoa.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Delete(Self);
  CmeDetalhe.Atualizabotoes(Self);
  CmeDetalhe.Operacao := OpApagar;
end;

procedure TfrmCadTipoDocPessoa.CmeDetalheAtualizaBotoes(Sender: TObject);
var
  lTemReg : Boolean;
begin
  inherited;
   If  (cdsDet <> nil) Then
  Begin
     sbtnInsDet.Down := (cdsDet.State = dsInsert);
     sbtnAltDet.Down := (cdsDet.State = dsEdit);
  End;

  if (CmeCadastro.Operacao in [opInserir,opAlterar]) and
     (VerificaMestre) then
  begin
    if (cdsDet <> nil) and (not cdsDet.IsEmpty) then
       lTemReg := true
    else
        lTemReg := false;

    sbtnInsDet.Enabled := (Not sbtnAltDet.Down);
    sbtnAltDet.Enabled := lTemReg And (Not sbtnInsDet.Down);
    sbtnExcluiDet.Enabled := lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);

  end
  else
  begin
     sbtnInsDet.Enabled := false;
     sbtnAltDet.Enabled := false;
     sbtnExcluiDet.Enabled := false;
  end;
  AutorizarForm(afSoDesabilitar);
end;

procedure TfrmCadTipoDocPessoa.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  cdsDet.Delete;
  bbtnOkDetClick(Self);
end;

procedure TfrmCadTipoDocPessoa.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  cdsDet.Edit;
end;

procedure TfrmCadTipoDocPessoa.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  cdsDet.Insert;
  dbedNomeTipo.setFocus;
end;

procedure TfrmCadTipoDocPessoa.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Confirma(Self);
end;

procedure TfrmCadTipoDocPessoa.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CmeDetalhe.Cancel(Self);
end;

procedure TfrmCadTipoDocPessoa.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  FazerVoltarDet;
end;

procedure TfrmCadTipoDocPessoa.FazerVoltarDet;
begin
   if (CdsDet <> nil) and (CdsDet.State in [dsEdit,dsInsert]) then
      CdsDet.Cancel;

   tb97Detalhe.Visible := false;

   if dbgrdDet <> nil then dbgrdDet.BringToFront;

   CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadTipoDocPessoa.CmeDetalheConfirma(Sender: TObject);
var
  bRepete : boolean;
begin
  if (cdsDet <> nil ) and (cdsDet.State in [dsInsert, dsEdit]) then
  begin
      bRepete := (CmeDetalhe.RepetirInsert) and (cdsDet.State = dsInsert);
      try
         cdsDet.Post;
         if bRepete then
            CmeDetalhe.Insert(Self)
         else
             FazerVoltarDet;
      except end;
      CmeDetalhe.Atualizabotoes(Self);

  end;
end;

procedure TfrmCadTipoDocPessoa.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  if cdsDet <> nil then
  begin
      cdsDet.Cancel;
      dbgrdDet.BringToFront;
  end;

  tb97Detalhe.Visible := false;
  CmeDetalhe.Atualizabotoes(Self);
end;

procedure TfrmCadTipoDocPessoa.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if cdsDet.State in [dsInsert, dsEdit] then
  begin
      if cdsDet.FieldByName('NOME').IsNull then
    begin
      //ShowMessage('Preencha o nome desse Tipo de Documento');// Michelle Mota - SIG 22093
      ShowMessage('Preencha Nome da Máscara');// Michelle Mota - SIG 22093 - alteração da MSG03
      Abort;
    end;
  end;
end;

function TfrmCadTipoDocPessoa.VerificaMestre: boolean;
begin
   if Cds.Active then
   begin
        if Cds.State in ([dsInsert,dsEdit]) then
           Result := true
        else
            if (Cds.IsEmpty) then
               Result := false
            else
                Result := true;
   end
   else
       Result := false;
end;
//Vinicius Maciel SOL138283 Kintana 840489 - FIM

// Início - Michelle Mota - SIG 22093
procedure TfrmCadTipoDocPessoa.sbtnApagarClick(Sender: TObject);
begin
  if (TipoDocPessoa.VerificaDocAssociado(Cds.FieldByName('IDDOCUMENTO').asString) >= 1)then
    begin
      //Darivaldo Alencar SIG 22093 -inicio
      MsgDlg('Tipo de Documentação não poderá ser excluído,'+#13+
             ' pois já foi associado.','Aviso',mtWarning,[mbOK],0);
      sbtnApagar.Down:= False;
      exit;
      //Darivaldo Alencar SIG 22093 -fim
    end;

    inherited;

  AtualizaGridExibeObriga;
end;

procedure TfrmCadTipoDocPessoa.GridExibeObrigaDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  R: TRect;
  LeftPrimCol, LeftSegCol, LeftTercCol : integer;  
begin
  inherited;
  // Desenhando os Títulos
  if (ARow = 0) and (ACol = 1) then (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + 5, Rect.Top + 2, 'Campo');
  if (ARow = 0) and (ACol = 2) then (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + 38, Rect.Top + 2, 'Exibir');
  if (ARow = 0) and (ACol = 3) then (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + 20, Rect.Top + 2, 'Obrigatório');

  // Preencher os dados da primeira coluna
  LeftPrimCol := 5;
  if (ARow = 1) and (ACol = 1) then (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + LeftPrimCol, Rect.Top + 2, 'UF');
  if (ARow = 2) and (ACol = 1) then (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + LeftPrimCol, Rect.Top + 2, 'Órgão Expedidor');
  if (ARow = 3) and (ACol = 1) then (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + LeftPrimCol, Rect.Top + 2, 'Data de Emissão');
  if (ARow = 4) and (ACol = 1) then (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + LeftPrimCol, Rect.Top + 2, 'Data de Validade');
  if (ARow = 5) and (ACol = 1) then (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + LeftPrimCol, Rect.Top + 2, 'Data da Primeira Habilitação');
  if (ARow = 6) and (ACol = 1) then (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + LeftPrimCol, Rect.Top + 2, 'Categoria');
  if (ARow = 7) and (ACol = 1) then (Sender as TStringGrid).Canvas.TextRect(Rect, Rect.Left + LeftPrimCol, Rect.Top + 2, 'País');

  // Desenhando os checkbox
  LeftSegCol := 45;
  if (ARow = 1) and (ACol = 2) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftSegCol , Rect.Top + 2, aValor[0,0]);
  if (ARow = 2) and (ACol = 2) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftSegCol , Rect.Top + 2, aValor[1,0]);
  if (ARow = 3) and (ACol = 2) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftSegCol , Rect.Top + 2, aValor[2,0]);
  if (ARow = 4) and (ACol = 2) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftSegCol , Rect.Top + 2, aValor[3,0]);
  if (ARow = 5) and (ACol = 2) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftSegCol , Rect.Top + 2, aValor[4,0]);
  if (ARow = 6) and (ACol = 2) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftSegCol , Rect.Top + 2, aValor[5,0]);
  if (ARow = 7) and (ACol = 2) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftSegCol , Rect.Top + 2, aValor[6,0]);

  LeftTercCol := 45;
  if (ARow = 1) and (ACol = 3) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftTercCol , Rect.Top + 2, aValor[0,1]);
  if (ARow = 2) and (ACol = 3) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftTercCol , Rect.Top + 2, aValor[1,1]);
  if (ARow = 3) and (ACol = 3) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftTercCol , Rect.Top + 2, aValor[2,1]);
  if (ARow = 4) and (ACol = 3) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftTercCol , Rect.Top + 2, aValor[3,1]);
  if (ARow = 5) and (ACol = 3) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftTercCol , Rect.Top + 2, aValor[4,1]);
  if (ARow = 6) and (ACol = 3) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftTercCol , Rect.Top + 2, aValor[5,1]);
  if (ARow = 7) and (ACol = 3) then ImageListApoiaGrid.Draw(GridExibeObriga.Canvas, Rect.Left + LeftTercCol , Rect.Top + 2, aValor[6,1]);  

  // Ajustar a largura das colunas
  GridExibeObriga.ColWidths[0] := 5;
  GridExibeObriga.ColWidths[1] := GridExibeObriga.Canvas.TextWidth('Data da Primeira Habilitação____________');
  GridExibeObriga.ColWidths[2] := GridExibeObriga.Canvas.TextWidth('___Obrigatório___');
  GridExibeObriga.ColWidths[3] := GridExibeObriga.ColWidths[2];
end;

procedure TfrmCadTipoDocPessoa.GridExibeObrigaClick(Sender: TObject);
begin
  inherited;
  // Atribui valor de acordo com a célula que foi alterada
  if (cds.state in [dsInsert, dsEdit]) then begin
    if (GridExibeObriga.Col = 2) and (GridExibeObriga.Row = 1) then
      if (cds.FieldByName('EXIBEUF').AsString = 'S') then
        cds.FieldByName('EXIBEUF').AsString := 'N'
      else
        cds.FieldByName('EXIBEUF').AsString := 'S';

    if (GridExibeObriga.Col = 3) and (GridExibeObriga.Row = 1) then
      if (cds.FieldByName('OBRIGAUF').AsString = 'S') then
        cds.FieldByName('OBRIGAUF').AsString := 'N'
      else
        begin cds.FieldByName('OBRIGAUF').AsString := 'S'; cds.FieldByName('EXIBEUF').AsString := 'S'; end;

    if (GridExibeObriga.Col = 2) and (GridExibeObriga.Row = 2) then
      if (cds.FieldByName('EXIBEORGAO').AsString = 'S') then
        cds.FieldByName('EXIBEORGAO').AsString := 'N'
      else
        cds.FieldByName('EXIBEORGAO').AsString := 'S';

    if (GridExibeObriga.Col = 3) and (GridExibeObriga.Row = 2) then
      if (cds.FieldByName('OBRIGAORGAO').AsString = 'S') then
        cds.FieldByName('OBRIGAORGAO').AsString := 'N'
      else
        begin cds.FieldByName('OBRIGAORGAO').AsString := 'S'; cds.FieldByName('EXIBEORGAO').AsString := 'S'; end;

    if (GridExibeObriga.Col = 2) and (GridExibeObriga.Row = 3) then
      if (cds.FieldByName('EXIBEEMISSAO').AsString = 'S') then
        cds.FieldByName('EXIBEEMISSAO').AsString := 'N'
      else
        cds.FieldByName('EXIBEEMISSAO').AsString := 'S';

    if (GridExibeObriga.Col = 3) and (GridExibeObriga.Row = 3) then
      if (cds.FieldByName('OBRIGAEMISSAO').AsString = 'S') then
        cds.FieldByName('OBRIGAEMISSAO').AsString := 'N'
      else
        begin cds.FieldByName('OBRIGAEMISSAO').AsString := 'S'; cds.FieldByName('EXIBEEMISSAO').AsString := 'S'; end;

    if (GridExibeObriga.Col = 2) and (GridExibeObriga.Row = 4) then
      if (cds.FieldByName('EXIBEVALIDADE').AsString = 'S') then
        cds.FieldByName('EXIBEVALIDADE').AsString := 'N'
      else
        cds.FieldByName('EXIBEVALIDADE').AsString := 'S';

    if (GridExibeObriga.Col = 3) and (GridExibeObriga.Row = 4) then
      if (cds.FieldByName('FLGOBRIGAVALIDADE').AsString = 'S') then
        cds.FieldByName('FLGOBRIGAVALIDADE').AsString := 'N'
      else
        begin cds.FieldByName('FLGOBRIGAVALIDADE').AsString := 'S'; cds.FieldByName('EXIBEVALIDADE').AsString := 'S'; end;

    if (GridExibeObriga.Col = 2) and (GridExibeObriga.Row = 5) then
      if (cds.FieldByName('EXIBEPRMHAB').AsString = 'S') then
        cds.FieldByName('EXIBEPRMHAB').AsString := 'N'
      else
        cds.FieldByName('EXIBEPRMHAB').AsString := 'S';

    if (GridExibeObriga.Col = 3) and (GridExibeObriga.Row = 5) then
      if (cds.FieldByName('OBRIGAPRMHAB').AsString = 'S') then
        cds.FieldByName('OBRIGAPRMHAB').AsString := 'N'
      else
        begin cds.FieldByName('OBRIGAPRMHAB').AsString := 'S'; cds.FieldByName('EXIBEPRMHAB').AsString := 'S'; end;

    if (GridExibeObriga.Col = 2) and (GridExibeObriga.Row = 6) then
      if (cds.FieldByName('EXIBECATG').AsString = 'S') then
        cds.FieldByName('EXIBECATG').AsString := 'N'
      else
        cds.FieldByName('EXIBECATG').AsString := 'S';

    if (GridExibeObriga.Col = 3) and (GridExibeObriga.Row = 6) then
      if (cds.FieldByName('OBRIGACATG').AsString = 'S') then
        cds.FieldByName('OBRIGACATG').AsString := 'N'
      else
        begin cds.FieldByName('OBRIGACATG').AsString := 'S'; cds.FieldByName('EXIBECATG').AsString := 'S'; end;

    if (GridExibeObriga.Col = 2) and (GridExibeObriga.Row = 7) then
      if (cds.FieldByName('EXIBEPAIS').AsString = 'S') then
        cds.FieldByName('EXIBEPAIS').AsString := 'N'
      else
        cds.FieldByName('EXIBEPAIS').AsString := 'S';

    if (GridExibeObriga.Col = 3) and (GridExibeObriga.Row = 7) then
      if (cds.FieldByName('OBRIGAPAIS').AsString = 'S') then
        cds.FieldByName('OBRIGAPAIS').AsString := 'N'
      else begin
         cds.FieldByName('OBRIGAPAIS').AsString := 'S';
         cds.FieldByName('EXIBEPAIS').AsString := 'S';
        end;
  end;

  AtualizaGridExibeObriga;
end;

procedure TfrmCadTipoDocPessoa.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  AtualizaGridExibeObriga;
end;

procedure TfrmCadTipoDocPessoa.AtualizaGridExibeObriga;
begin
  // Atualiza variável que controla os ícones
  aValor[0,0] := Integer(cds.FieldByName('EXIBEUF').AsString = 'S');
  aValor[0,1] := Integer(cds.FieldByName('OBRIGAUF').AsString = 'S');
  aValor[1,0] := Integer(cds.FieldByName('EXIBEORGAO').AsString = 'S');
  aValor[1,1] := Integer(cds.FieldByName('OBRIGAORGAO').AsString = 'S');
  aValor[2,0] := Integer(cds.FieldByName('EXIBEEMISSAO').AsString = 'S');
  aValor[2,1] := Integer(cds.FieldByName('OBRIGAEMISSAO').AsString = 'S');
  aValor[3,0] := Integer(cds.FieldByName('EXIBEVALIDADE').AsString = 'S');
  aValor[3,1] := Integer(cds.FieldByName('FLGOBRIGAVALIDADE').AsString = 'S');
  aValor[4,0] := Integer(cds.FieldByName('EXIBEPRMHAB').AsString = 'S');
  aValor[4,1] := Integer(cds.FieldByName('OBRIGAPRMHAB').AsString = 'S');
  aValor[5,0] := Integer(cds.FieldByName('EXIBECATG').AsString = 'S');
  aValor[5,1] := Integer(cds.FieldByName('OBRIGACATG').AsString = 'S');
  aValor[6,0] := Integer(cds.FieldByName('EXIBEPAIS').AsString = 'S');
  aValor[6,1] := Integer(cds.FieldByName('OBRIGAPAIS').AsString = 'S');
  // Desenha novamente o grid
  GridExibeObriga.Repaint;
end;

procedure TfrmCadTipoDocPessoa.bbtnConfirmarClick(Sender: TObject);
var
  Status: TDataSetState;
begin
  CmeCadastro.RepetirInsert:= false; //Darivaldo Alencar SIG 22093
  Status := cds.State;//Darivaldo Alencar SIG 22093

  inherited;

  //Darivaldo Alencar SIG 22093 - inicio
  {Limpar a Tela Após Fazer Insert}
  if (Status = dsInsert) then
    begin
      cds.EmptyDataSet;
      bbtnCancelar.Click;
    end;
  //Darivaldo Alencar SIG 22093 -fim

  AtualizaGridExibeObriga;//Michelle Mota SIG 22093
end;

procedure TfrmCadTipoDocPessoa.ExcluirMascaras;
begin
  with CdsDet do
    begin
       DisableControls;
       First;
       while not eof do
       begin
          Delete;
          //Next; //Darivaldo ALencar SIG 22093
       end;
       EnableControls;
    end;
end;
// Término - Michelle Mota - SIG 22093

end.
