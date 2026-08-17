// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr,
  TB97Ctls, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti,
  fcLabel, uRegra, AppEvnts, StdActns, ActnList, ImgList, fcStatusBar,
  CMApplicationEvents, wwdbdatetimepicker, CMDateTimePicker, SConnect,
  MConnect, DBClient, fTelaAut, jPeg, wwriched, uResource, CMNetUsers,
  wwstorep;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    N3: TMenuItem;
    menuDicionriodeDados1: TMenuItem;
    N4: TMenuItem;
    mnuVarivei1: TMenuItem;
    menuGruposdeFrmulas1: TMenuItem;
    menuFrmulas1: TMenuItem;
    menuRegrasdeNegcio1: TMenuItem;
    N5: TMenuItem;
    menuTabelasGenricas1: TMenuItem;
    menuTabelasLongas1: TMenuItem;
    MnuProcessos: TMenuItem;
    menuDetalhesdeRegras1: TMenuItem;
    N6: TMenuItem;
    ExportarRegras1: TMenuItem;
    ImportarRegras1: TMenuItem;
    N7: TMenuItem;
    ExportaImportaDicionriodeDados1: TMenuItem;
    ImportarTabelasGenericas1: TMenuItem;
    ImportarTabelasLongasTeste1: TMenuItem;
    menuTabelasGenricasteste1: TMenuItem;
    N8: TMenuItem;
    menuPermissesdeAcesso1: TMenuItem;
    AtualizaDicDadosInternoCM1: TMenuItem;
    N9: TMenuItem;
    TestesdoRegra1: TMenuItem;
    TipodeRegra1: TMenuItem;
    N10: TMenuItem;
    GruposdeRegras1: TMenuItem;
    Toolbar971: TToolbar97;
    BtExecutaRegra: TToolbarButton97;
    ToolbarSep971: TToolbarSep97;
    BtCadRegra: TToolbarButton97;
    MnuExecutarregra: TMenuItem;
    N13: TMenuItem;
    BtCadFormula: TToolbarButton97;
    Button1: TButton;
    QryAux: TwwQuery;
    OpenDialog: TOpenDialog;
    QueryAuxiliar: TwwQuery;
    N1: TMenuItem;
    DataSource1: TDataSource;
    ControledeAcessoTAbelasGenricas1: TMenuItem;
    MnItControleAcessoTipoRegra: TMenuItem;
    procedure menuTipodeRegra1Click(Sender: TObject);
    procedure menuDicionriodeDados1Click(Sender: TObject);
    procedure menuAtualizarVariveis1Click(Sender: TObject);
    procedure mnuVarivei1Click(Sender: TObject);
    procedure menuGruposdeFrmulas1Click(Sender: TObject);
    procedure menuFrmulas1Click(Sender: TObject);
    procedure menuTabelasGenricas1Click(Sender: TObject);
    procedure menuTabelasLongas1Click(Sender: TObject);
    procedure menuDetalhesdeRegras1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure menuRegrasdeNegcio1Click(Sender: TObject);
    procedure ExportarRegras1Click(Sender: TObject);
    procedure ImportarRegras1Click(Sender: TObject);
    procedure ExportaImportaDicionriodeDados1Click(Sender: TObject);
    procedure ImportarTabelasGenericas1Click(Sender: TObject);
    procedure ImportarTabelasLongasTeste1Click(Sender: TObject);
    procedure menuTabelasGenricasteste1Click(Sender: TObject);
    procedure menuGruposdeRegras1Click(Sender: TObject);
    procedure menuPermissesdeAcesso1Click(Sender: TObject);
    procedure AtualizaDicDadosInternoCM1Click(Sender: TObject);
    procedure TestesdoRegra1Click(Sender: TObject);
    procedure BtCadRegraClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MnuExecutarregraClick(Sender: TObject);
    procedure TransfereRegras1Click(Sender: TObject);
    procedure BtCadFormulaClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ControledeAcessoTAbelasGenricas1Click(Sender: TObject);
    procedure MnItControleAcessoTipoRegraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  //******************************************************************************
  // DialogBox com Duracao para fechar.
  TMessageDlgTimer=Class(TComponent)
    Private
      // Variaveis Privadas
      FrmShowMessage : TForm;
      FDuracao : Integer;
      Timer : TTimer;
      Inicio : TTime;
    Public
      // Procedimentos Publicos
      Procedure Mostrar(Titulo, Mensagem:String;Duracao:Integer);
      Procedure Fechar;
      Procedure MessageDlgTimer(Sender: TObject);

      Procedure SetDuracao(iDuracao:Integer);

      Property  Duracao:Integer Read FDuracao Write SetDuracao;
  End;
  //******************************************************************************

var
  frmPrincipal: TfrmPrincipal;

implementation

uses fDicionarioDados,  FCadTipoRegraMT,      uMensErro,
     fAtualizVariaveis, FCadVariavelMT,      FCadGrpFormulaMT,    fCadFormulaMT,
     fCadTabelaLonga,   fCadRegra,          fExecutaRegra,       fDetalhes,
     fParamRegra,       fExportarRegras,    fImportarRegras,     fExportaDicDados,
     fImportaTabLonga,  fCadTabelaGenerica, fTestesRegra,        fCadTab,
     FCadGrpRegraMT,    FControleAcessoGrpRegraMT,      fMigraDicDados,
     fCadCampos,        fTransfereDados,    fImportaTabGenerica, dRelRegra,
     dRelDetalhes,      uBiblioteca,        ComObj,              ppForms,
     ppPrvDlg, FCadastroPai, FControleAcessoTabGenerMT, dBaseDados,
     FControleAcessoTipoRegraMT, UCtrlGrpRegraUsuario, uGimp ;

{$R *.DFM}

//******************************************************************************
// PROCEDIMENTOS DO OBJETO DA MENSAGEM DE DIALOGO

// Cria e Mostra o Objeto
Procedure TMessageDlgTimer.Mostrar(Titulo, Mensagem:String;Duracao:Integer);
Var
  I : Integer;
Begin
// Cria Objetos Locais
  Timer := TTimer.Create(Nil);

// Cria Caixa de Dialogo propria
  FrmShowMessage := CreateMessageDialog(Mensagem,  mtInformation,  [mbYes, mbNo]);
  FrmShowMessage.Caption := Titulo;

  For I := 1 To FrmShowMessage.ComponentCount-1 Do Begin
    If FrmShowMessage.Components[I].ClassName = 'TButton' Then Begin
      If (FrmShowMessage.Components[I] As TButton).Caption = '&Yes' Then
        (FrmShowMessage.Components[I] As TButton).Caption := '&Sim';
      If (FrmShowMessage.Components[I] As TButton).Caption = '&No' Then
        (FrmShowMessage.Components[I] As TButton).Caption := '&Não';
    End;
  End;

// Guarda o Inicio e Dispara o Timer
  Inicio :=  Time;

// Parametriza o Timer
  Timer.Interval := 4000;
  Timer.OnTimer  := MessageDlgTimer;
  Timer.Enabled  := True;

  SetDuracao(Duracao);

// mostra Caixa de Dialogo
  FrmShowMessage.ShowModal;
End;

// Metodo de Fechar o Componente
Procedure TMessageDlgTimer.Fechar;
Begin
  FDuracao := 0;
  MessageDlgTimer(Self);
End;

//------------------------------------------------------------------------------
// Tempo do Objeto
Procedure TMessageDlgTimer.MessageDlgTimer(Sender: TObject);
Begin

// FrmShowMessage.caption := FormatDateTime('NN:SS', Time - Inicio );

// Caso caixa não tenha sido Fechada, Fecha Libera
 If ( StrToInt(FormatDateTime('NN', Time - Inicio )) >= FDuracao ) Then Begin
   Try
// Fecha o DialogBox
     FrmShowMessage.Close;
// Desliga Timer
     Timer.OnTimer := Nil;
     Timer.Enabled :=False;
   Finally
//     FrmShowMessage.Free;
   End;
 End;

End;

Procedure TMessageDlgTimer.SetDuracao(iDuracao:Integer);
Begin
  If iDuracao > 60 Then Begin
    iDuracao  := 60;
  End;
  FDuracao := iDuracao;
End;

// FIM DOS PROCEDIMENTOS
//******************************************************************************

procedure TfrmPrincipal.menuTipodeRegra1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmCadTipoRegraMT, TFrmCadTipoRegraMT, False)
end;

procedure TfrmPrincipal.menuDicionriodeDados1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (frmDicionarioDados, TfrmDicionarioDados, False);
end;

procedure TfrmPrincipal.menuAtualizarVariveis1Click(Sender: TObject);
begin
  inherited;
  AbrirForm ( frmAtualizVariaveis, tfrmAtualizVariaveis, False );
end;

procedure TfrmPrincipal.mnuVarivei1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmCadVariavelMT, TFrmCadVariavelMT, False);
end;

procedure TfrmPrincipal.menuGruposdeFrmulas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmCadGrpFormulaMT, TFrmCadGrpFormulaMT, False );
end;

procedure TfrmPrincipal.menuFrmulas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmCadFormulaMT, TFrmCadFormulaMT, False);
end;

procedure TfrmPrincipal.menuTabelasGenricas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (frmCadTabela, tfrmCadTabela, False);
end;

procedure TfrmPrincipal.menuTabelasLongas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (frmCadTabelaLonga, tfrmCadTabelaLonga, False );
end;

procedure TfrmPrincipal.menuDetalhesdeRegras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmDetalhes, TfrmDetalhes, False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
  inherited;
  AbrirForm( frmParamRegra,TfrmParamRegra, False);
end;

procedure TfrmPrincipal.menuRegrasdeNegcio1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (frmCadRegra, tfrmCadRegra, False);
end;

procedure TfrmPrincipal.ExportarRegras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmExportarRegras,TfrmExportarRegras, False);
end;

procedure TfrmPrincipal.ImportarRegras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmImportarRegras,TfrmImportarRegras, False);

end;

procedure TfrmPrincipal.ExportaImportaDicionriodeDados1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(frmExportaDicDados, tfrmExportaDicDados, False);
end;

procedure TfrmPrincipal.ImportarTabelasGenericas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportaTabGenerica,tfrmImportaTabGenerica,False);
end;

procedure TfrmPrincipal.ImportarTabelasLongasTeste1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmImportaTabLonga,TfrmImportaTabLonga, False );
end;

procedure TfrmPrincipal.menuTabelasGenricasteste1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( frmCadTabelaGenerica,TfrmCadTabelaGenerica, False);
end;

procedure TfrmPrincipal.menuGruposdeRegras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadGrpRegraMT, TFrmCadGrpRegraMT, False);
end;

procedure TfrmPrincipal.menuPermissesdeAcesso1Click(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmControleAcessoGrpRegraMT, TFrmControleAcessoGrpRegraMT, False);
end;

procedure TfrmPrincipal.AtualizaDicDadosInternoCM1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmMigraDicDados, tfrmMigraDicDados, False);

end;

procedure TfrmPrincipal.TestesdoRegra1Click(Sender: TObject);
begin
  inherited;

  //CPrev - 27261 - Inicio
  //Try
  //  FrmTestesRegra := TFrmTestesRegra.Create(Self);
  //
  //  FrmTestesRegra.ShowModal;
  //Finally
  //  FrmTestesRegra.Free;
  //End;
  //CPrev - 27261 - Fim
end;

procedure TfrmPrincipal.BtCadRegraClick(Sender: TObject);
begin
  inherited;
  AbrirForm (frmCadRegra, tfrmCadRegra, False);
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  I, J, wTotCampos : Integer;
  wDecimal   : Char;
  sNomeArquivo, sArquivo, sLinhaCampos,
  sLinhaValores, sSQL : String;
  ExcelApp, Sheet : Variant;

  Ima:TJpegImage;

  Porta_Impressora, A : String;
  gimpEtiq : TGImp;
  FImpresora : TextFile;
begin
  Try
    FrmTestesRegra := TFrmTestesRegra.Create(Self);

    FrmTestesRegra.ShowModal;
  Finally
    FrmTestesRegra.Free;
  End;
  Exit;
  
   {---------------------------------------------------------------------------}
   { Teste Impressão 1                                                         }

   Porta_Impressora := '\\DESENV0055\HP';
   AssignFile(FImpresora,Porta_Impressora);
   ReWrite(FImpresora);
   WriteLn(FImpresora, 'OUTRO TESTE DIRETO DO REGRA');
   
   CloseFile(FImpresora);

   Exit;


   {---------------------------------------------------------------------------}
   { Teste Impressão 2                                                         }

   gimpEtiq                    := Tgimp.Create(Application);
   gimpEtiq.DataBaseName       := 'BaseDados';
   gimpEtiq.MostraPrinterSetup := True;
   gimpEtiq.EjetarPagina       := True;
   gimpEtiq.Condensado         := True;


   If gimpEtiq.Inicializar Then
   Begin
      gimpEtiq.EjetarPagina           := True;
      gimpEtiq.SaltodeLinhaCondensado := False;
      gimpEtiq.Condensado             := True;
      gimpEtiq.TipoFonte              := TfNormal;

      gimpEtiq.ImprimirTexto('TESTE');

      gimpEtiq.Finalizar;

   End;

   gimpEtiq.Free;

   Exit;
   {---------------------------------------------------------------------------}

  exit;
  AbrirForm (FrmControleAcessoTipoRegraMT, TFrmControleAcessoTipoRegraMT, False);
  Exit;


  {--------------------------------------}
  { Relatório do SRB                     }
  dRelRegra.dtmRelRegra.iIdPessoa    := 2312;             { IDPESSOA           }
  dRelRegra.dtmRelRegra.iIdPessJur   := 50031;            { IDPESSJUR          }
  dRelRegra.dtmRelRegra.iIdBeneficio := 8;                { IDBENEFICIO        }
  dRelRegra.dtmRelRegra.sAnoMesRef   := '2001/11';        { ANOMES REFERENCIA  }
  dRelRegra.dtmRelRegra.sNomeIndiceTeto := '';            { INDICE TETO        }
  dRelRegra.dtmRelRegra.sNomeIndiceReaj := 'REAJSRB';     { INDICE DE REAJUSTE }

  { Primeiro Relatório, parcela "A" }
  dRelRegra.dtmRelRegra.sGrupoRubrica   := 'A';
  dRelRegra.dtmRelRegra.QrySRB.Close;
  dRelRegra.dtmRelRegra.QrySRB.ParamByName('IDPESSOA').AsInteger    := 2312;    { IDPESSOA    }
  dRelRegra.dtmRelRegra.QrySRB.ParamByName('IDBENEFICIO').AsInteger := 8;       { IDBENEFICIO }
  dRelRegra.dtmRelRegra.QrySRB.Open;
  dRelRegra.dtmRelRegra.ppSRB.Print;
  Exit;
  
  { Primeiro Relatório, parcela "B" }
  dRelRegra.dtmRelRegra.sGrupoRubrica    := 'B';
  dRelRegra.dtmRelRegra.QrySRB.Close;
  dRelRegra.dtmRelRegra.QrySRB.ParamByName('IDPESSOA').AsInteger    := 2312;    { IDPESSOA    }
  dRelRegra.dtmRelRegra.QrySRB.ParamByName('IDBENEFICIO').AsInteger := 8;       { IDBENEFICIO }
  dRelRegra.dtmRelRegra.QrySRB.Open;
  dRelRegra.dtmRelRegra.ppSRBB.Print;
  Exit;
  {--------------------------------------}


  { Executa Dialogo de procura do Arquivo }
  If (OpenDialog.Execute) Then Begin
    sArquivo := UpperCase(OpenDialog.FileName);
  End Else Begin
    Exit;
  End;

  wDecimal         := DecimalSeparator;
  DecimalSeparator := '.';

  { Testa se Arquivo Especificado Existe }
  If Not (FileExists(sArquivo)) Then Begin
    ShowMessage('Arquivo não Existe ou Inválido ...');
    Exit;
  End;

  {----------------------------------------------------------------------------}
  { Tenta Abrir o Arquivo e Importar dados                                     }
  { conseguindo ou não Fecha o Arquivo                                         }
  Try
    { LbProcesso.Caption:='Conectando com o Excell.'; }

    { Conecta com o Excel }
    ExcelApp:=IDispatch(ExcelApp);
    ExcelApp:=CreateOleObject('Excel.Application');
    ExcelApp.Visible:=False;

    { Abre o arquivo Excel, não atualizando os links caso tenha }
    ExcelApp.Workbooks.Open(sArquivo,0);
    sNomeArquivo := ExtractFileName(sArquivo); { Guarda o Nome do Arquivo }
    sNomeArquivo := Copy(sNomeArquivo,1, (Pos('.',sNomeArquivo)-1) );

    Sheet := ExcelApp.Workbooks[1].WorkSheets['Plan1'];

    { Pausa para Abrir a Planilha a Importacao }
    Application.ProcessMessages;

    { Busca estrutura da Tabela }
    Try
      QueryAuxiliar.SQL.Clear;
      QueryAuxiliar.SQL.Add('SELECT * FROM '+sNomeArquivo+' WHERE 1 = 2 '); { Suicida }
      QueryAuxiliar.Open;
    Except
      ShowMessage('Erro buscar tabela '+sNomeArquivo+' no Banco de Dados !!');
    End;
    wTotCampos   := (QueryAuxiliar.FieldDefs.Count-1);
    sLinhaCampos := '(';

    { Varre todos os campos da Query }
    For I := 0 To  wTotCampos Do Begin
      sLinhaCampos := sLinhaCampos+QueryAuxiliar.FieldDefs.Items[I].Name+', ';
    End;
    sLinhaCampos := Copy(sLinhaCampos, 1, (Length(Trim(sLinhaCampos))-1) );
    sLinhaCampos := Trim(sLinhaCampos) + ')';

    { Inicia Processamento }

    { Leitura das Linhas }
    For I := 1 To (Sheet.UsedRange.Rows.Count) Do Begin
      sLinhaValores := '(';
      { Varre todos as Colunas para montar a linha de valores }
      For J := 1 To (wTotCampos+1) Do Begin 
        If Trim(Sheet.Cells[I,J]) = '' Then Begin
          sLinhaValores := sLinhaValores+'NULL,';
        End Else Begin
          sLinhaValores := sLinhaValores+QuotedStr(Trim(Sheet.Cells[I,J]))+', ';
        End;

      End;
      sLinhaValores := Copy(sLinhaValores, 1, (Length(Trim(sLinhaValores))-1) );
      sLinhaValores := Trim(sLinhaValores) + ')';

      { Tenta inserir registro no banco de dados }
      sSQL := 'INSERT INTO '+sNomeArquivo+' '+sLinhaCampos +' VALUES '+sLinhaValores;
      If Not ExecutaQuery(QueryAuxiliar, sSQL) Then Begin
        Exit;
      End;

    End; { For }
    DecimalSeparator :=  wDecimal;

  Finally
    { Fecha o Arquivo Independente do resultado da Operacao }
    ExcelApp.Workbooks[1].Close(False);
    ExcelApp.Quit;
  End;

  ShowMessage('Importação Terminada !');
end;

procedure TfrmPrincipal.MnuExecutarregraClick(Sender: TObject);
begin
  inherited;
  try
    AbrirForm(frmExecutaRegra, tfrmExecutaRegra, False);
  except
    MsgDlg('Memória insuficiente. Feche uma ou mais janelas e tente novamente',
           'Atenção',mterror,[mbOk,mbHelp],0);
    Raise;
  end;
end;

procedure TfrmPrincipal.TransfereRegras1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmTransfereDados, TFrmTransfereDados, False);

end;

procedure TfrmPrincipal.BtCadFormulaClick(Sender: TObject);
begin
  inherited;
 AbrirForm (FrmCadFormulaMT, TFrmCadFormulaMT, False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
Var
  sSQL : String;
  CtrlGrpRegraUsuario : TCtrlGrpRegraUsuario;
begin
// Heranca
  Inherited;

  If Not FazQuery(QryAux,'SELECT FLGCAMPO, FLGVARIAVEL FROM PARAMREGRA') Then Begin
    MsgDlg('Parametrização do Regra ainda não foi atualizada. ',
           'Atenção',MtInformation,[mbOk],0);
    AbrirForm(frmParamRegra,TfrmParamRegra, False);
  End;
  
  Exit;

  {----------------------------------------------------------------------------}
  { Atualiza Controle de Acesso                                                }
  sSQL := 'SELECT * FROM GRUPOREGRAUSUARIO WHERE IDGRUPOREGRAUSU IS NULL';
  If FazQuery(QryAux,sSQL) Then begin
    MsgDlg('Controle de acesso será atualizado. ','Atenção',mtWarning,[MbOk],0);

    CtrlGrpRegraUsuario := TCtrlGrpRegraUsuario.Create;
    CtrlGrpRegraUsuario.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                   Nil);
    CtrlGrpRegraUsuario.AcertaControleAcesso;

    MsgDlg('Atualização terminada. ','Atenção',mtConfirmation,[MbOk],0);

    FreeAndNil(CtrlGrpRegraUsuario);
    {--------------------------------------------------------------------------}

  End;
  //Jéssica Lana SOL 109421 KINTANA 496332
  OpenDialog.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\';
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
  inherited;
// Caso não tenham sido criados os Relatorios, Cria.
   Application.CreateForm(TdtmRelRegra,dtmRelRegra);
   Application.CreateForm(TdtmRelDetalhes,dtmRelDetalhes);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  inherited;
  ppRegisterForm(TppCustomPreviewer,TppPrintPreview);
end;


procedure TfrmPrincipal.ControledeAcessoTAbelasGenricas1Click(
  Sender: TObject);
begin
  inherited;
 AbrirForm (FrmControleAcessoTabGenerMT, TFrmControleAcessoTabGenerMT, False);
end;

procedure TfrmPrincipal.MnItControleAcessoTipoRegraClick(Sender: TObject);
begin
  inherited;
  AbrirForm (FrmControleAcessoTipoRegraMT, TFrmControleAcessoTipoRegraMT, False);
end;

initialization
   Sistema.NomeModulo:= 'Regras de Negócio';    // Nome do Módulo
   Sistema.IdModulo  := 45 ;                    // IdModulo Cadastrado no SAD
   Sistema.Versao := '3.02.09a';
   Sistema.NomeAplicativo:= 'Regras de Negócio';

finalization

end.



