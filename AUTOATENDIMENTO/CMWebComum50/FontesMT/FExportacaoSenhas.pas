unit FExportacaoSenhas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, ComObj,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, uCMClientDataSet, ComCtrls, JClStrings,
  uCMCrypto, uCtrlWebAcesso, uCtrlWebConfiguracao, uCmTypes, dBaseDados, uSistema;

type
  TfrmExportacaoSenhas = class(TfrmOkCancelar)
    grpOpcoesExportacao: TGroupBox;
    rbTodos: TRadioButton;
    rbLOGINPESSOAL: TRadioButton;
    edtLOGINPESSOAL: TEdit;
    rgrpTipoArquivo: TRadioGroup;
    dlgSalvar: TSaveDialog;
    cdsWebAcesso: TCMClientDataSet;
    ProgressBar: TProgressBar;
    cdsWebConfiguracao: TCMClientDataSet;
    cdsWebConfiguracaoIDFUNDACAO: TFloatField;
    cdsWebConfiguracaoNOMEBASE: TStringField;
    cdsWebConfiguracaoSENHAMIN: TFloatField;
    cdsWebConfiguracaoSENHAMAX: TFloatField;
    cdsWebConfiguracaoSENHACASE: TStringField;
    cdsWebConfiguracaoSENHACRIPTO: TStringField;
    cdsWebConfiguracaoLOGINMASTER: TStringField;
    cdsWebConfiguracaoSENHAMASTER: TStringField;
    chkIdPessoa: TCheckBox;
    chkNome: TCheckBox;
    chkLogradouro: TCheckBox;
    chkNumero: TCheckBox;
    chkComplemento: TCheckBox;
    chkBairro: TCheckBox;
    chkCidade: TCheckBox;
    chkEstado: TCheckBox;
    chkCEP: TCheckBox;
    rbQuery: TRadioButton;
    memQuery: TMemo;
    chkNumSeed: TCheckBox;
    rbNaoExportados: TRadioButton;
    cdsWebConfiguracaoFLGCTRCHQATV: TStringField;
    cdsWebConfiguracaoFLGINFRENDATV: TStringField;
    cdsWebConfiguracaoFLGEXTEMPTMOATV: TStringField;
    cdsWebConfiguracaoNUMSENHABLQ: TFloatField;
    cdsWebConfiguracaoPRETEXTOEXPORTA: TStringField;
    cdsWebConfiguracaoPOSTEXTOEXPORTA: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rbLOGINPESSOALClick(Sender: TObject);
    procedure rbTodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgrpTipoArquivoClick(Sender: TObject);
    procedure rbQueryClick(Sender: TObject);
  private

    WebAcesso : TCtrlWebAcesso;
    WebConfiguracao : TCtrlWebConfiguracao;

    CMCrypto : TCMCrypto;

    bSenhaCrypto : boolean;

    procedure MsgErro ( sMsg : String );

  public
    { Public declarations }
  end;

var
  frmExportacaoSenhas: TfrmExportacaoSenhas;

implementation

{$R *.DFM}

procedure TfrmExportacaoSenhas.bbtnConfirmarClick(Sender: TObject);
var
  sStr : TStringList;
  sSenha : string;
  ExcelApp, Sheet : Variant;
  i, iCol : integer;
  sLinha : String;
begin
  inherited;

  sStr := TStringList.Create;
  try

    //Reseta a ProgressBar
    ProgressBar.Position := 0;

    //Configura a dialog com os dados do tipo de arquivo selecionado
    if rgrpTipoArquivo.ItemIndex = 0 then //Planilha do Excel
    begin
      dlgSalvar.DefaultExt := '*.xls';
      dlgSalvar.Filter := 'Planilha do Excel (*.xls)|*.XLS|Todos os arquivos (*.*)|*.*';
    end
    else                                  //Arquivo texto
    begin
      dlgSalvar.DefaultExt := '*.txt';
      dlgSalvar.Filter := 'Arquivo texto (*.txt)|*.TXT|Todos os arquivos (*.*)|*.*';
    end;

    //Se o usuário escolher o arquivo...
    if dlgSalvar.Execute then
    begin

      //Fecha o dataset
      cdsWebAcesso.Close;

      //Seleciona os registros
      if rbLOGINPESSOAL.Checked  then
      begin
        //Login específico

        //Se o login não foi preenchido...
        if trim( edtLOGINPESSOAL.Text ) = '' then
        begin
          ShowMessage('Infome o login do usuário.');
          edtLOGINPESSOAL.SetFocus;
          exit;
        end; 

        cdsWebAcesso.Data := WebAcesso.MalaDiretaPorLogin( edtLOGINPESSOAL.Text );
      end
      else if rbQuery.Checked  then
      begin
        //Login retornados por query

        //Se a query não foi preenchida...
        if trim( memQuery.Text ) = '' then
        begin
          ShowMessage('Infome a query.');
          memQuery.SetFocus;
          exit;
        end; 

        cdsWebAcesso.Data := WebAcesso.MalaDiretaPorQuery( memQuery.Text );
      end
      else if rbNaoExportados.Checked  then
      begin
        //Registros ainda não exportados
        cdsWebAcesso.Data := WebAcesso.MalaDiretaNaoExportados;
      end
      else
        //Todos os registros
        cdsWebAcesso.Data := WebAcesso.MalaDiretaTodos;


      //Se houverem registros...
      if not cdsWebAcesso.IsEmpty then
      begin

        //Inicializa dados do processo
        ProgressBar.Min := 0;
        ProgressBar.Max := cdsWebAcesso.RecordCount;


        //Se for Excel, prepara a planilha
        if rgrpTipoArquivo.ItemIndex = 0 then
        begin

          //Conecta com o Excel
          ExcelApp := IDispatch( ExcelApp );
          ExcelApp := CreateOleObject( 'Excel.Application' );
          ExcelApp.Visible := False;

          //Cria o arquivo
          ExcelApp.Workbooks.Add;

          Application.ProcessMessages;
          try
            Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Plan1'];
          except
            Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Sheet1'];
          end;
          Application.ProcessMessages;

        end; 

        if rgrpTipoArquivo.ItemIndex = 1 then                         //Se o tipo de arquivo é texto...
          if not cdsWebConfiguracaoPRETEXTOEXPORTA.IsNull then           //Se o pré-texto não é nulo...
            sStr.Add( cdsWebConfiguracaoPRETEXTOEXPORTA.AsString );       //Inclui o texto antes dos dados

        //Loop de registros
        i := 1;
        cdsWebAcesso.First;
        while ( not cdsWebAcesso.Eof ) do
        begin

          //Recupera a senha
          sSenha := cdsWebAcesso.FieldByName('SENHAPESSOAL').AsString;

          //Se for criptografada, decodifica a senha
          if bSenhaCrypto then
            sSenha := trim( CMCrypto.CMDecryptStr( StrPadRight( sSenha, 20, ' '),
               '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' ) );

          //Testa o tipo de arquivo
          if rgrpTipoArquivo.ItemIndex = 0 then //Planilha do Excel
          begin
            iCol := 1;

            if chkIdPessoa.Checked    then begin Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('IDPESSOA').AsString )   ; inc(iCol); end;
            if chkNome.Checked        then begin Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('NOME').AsString )       ; inc(iCol); end;
            if chkLogradouro.Checked  then begin Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('LOGRADOURO').AsString ) ; inc(iCol); end;
            if chkNumero.Checked      then begin Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('NUMERO').AsString )     ; inc(iCol); end;
            if chkComplemento.Checked then begin Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('COMPLEMENTO').AsString ); inc(iCol); end;
            if chkBairro.Checked      then begin Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('BAIRRO').AsString )     ; inc(iCol); end;
            if chkCidade.Checked      then begin Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('CIDADE').AsString )     ; inc(iCol); end;
            if chkEstado.Checked      then begin Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('ESTADO').AsString )     ; inc(iCol); end;
            if chkCEP.Checked         then begin Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('CEP').AsString )        ; inc(iCol); end;
            if chkNumSeed.Checked     then begin Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('NUMSEED').AsString )    ; inc(iCol); end;

            Sheet.Cells[i,iCol] := trim( cdsWebAcesso.FieldByName('LOGINPESSOAL').AsString ); inc(iCol);
            Sheet.Cells[i,iCol] := sSenha;
          end
          else                                  //Arquivo texto
          begin
            //Monta a string

            sLinha := '';

            if chkIdPessoa.Checked    then sLinha := sLinha + trim( cdsWebAcesso.FieldByName('IDPESSOA').AsString )    + ';';
            if chkNome.Checked        then sLinha := sLinha + trim( cdsWebAcesso.FieldByName('NOME').AsString )        + ';';
            if chkLogradouro.Checked  then sLinha := sLinha + trim( cdsWebAcesso.FieldByName('LOGRADOURO').AsString )  + ';';
            if chkNumero.Checked      then sLinha := sLinha + trim( cdsWebAcesso.FieldByName('NUMERO').AsString )      + ';';
            if chkComplemento.Checked then sLinha := sLinha + trim( cdsWebAcesso.FieldByName('COMPLEMENTO').AsString ) + ';';
            if chkBairro.Checked      then sLinha := sLinha + trim( cdsWebAcesso.FieldByName('BAIRRO').AsString )      + ';';
            if chkCidade.Checked      then sLinha := sLinha + trim( cdsWebAcesso.FieldByName('CIDADE').AsString )      + ';';
            if chkEstado.Checked      then sLinha := sLinha + trim( cdsWebAcesso.FieldByName('ESTADO').AsString )      + ';';
            if chkCEP.Checked         then sLinha := sLinha + trim( cdsWebAcesso.FieldByName('CEP').AsString )         + ';';
            if chkNumSeed.Checked     then sLinha := sLinha + trim( cdsWebAcesso.FieldByName('NUMSEED').AsString )     + ';';

            sLinha := sLinha + trim( cdsWebAcesso.FieldByName('LOGINPESSOAL').AsString ) + ';';
            sLinha := sLinha + sSenha;

            sStr.Add( sLinha );

          end;

          WebAcesso.RegistraExportacao( cdsWebAcesso.FieldByName('IDPESSOA').AsInteger );

          //Atualiza a ProgressBar
          ProgressBar.StepIt;

          //Incrementa i
          Inc( i );

          cdsWebAcesso.Next;
        end; 

        //Testa o tipo de arquivo
        if rgrpTipoArquivo.ItemIndex = 0 then //Planilha do Excel
        begin
          ExcelApp.ActiveWorkbook.SaveAs( dlgSalvar.FileName );
        end
        else                                  //Arquivo texto
        begin
          if rgrpTipoArquivo.ItemIndex = 1 then                         //Se o tipo de arquivo é texto...
            if not cdsWebConfiguracaoPOSTEXTOEXPORTA.IsNull then          //Se o pós-texto não é nulo...
              sStr.Add( cdsWebConfiguracaoPOSTEXTOEXPORTA.AsString );       //Inclui o texto depois dos dados

          //Salava o arquivo txt
          sStr.SaveToFile( dlgSalvar.FileName );
        end;

      end; 


      //Se for planilha do Excel, fecha o arquivo
      if rgrpTipoArquivo.ItemIndex = 0 then
      begin
        ExcelApp.ActiveWorkbook.Close( False );
        ExcelApp.Quit;
        Application.ProcessMessages;
      end;

      //Mensagem informando sucesso da operação.
      ShowMessage( 'Arquivo gerado com sucesso.' );

      //Reseta a ProgressBar
      ProgressBar.Position := 0;

    end; 

  finally
    sStr.Free;
  end;
  
end; 


procedure TfrmExportacaoSenhas.rbLOGINPESSOALClick(Sender: TObject);
begin
  inherited;
  edtLOGINPESSOAL.Enabled := rbLOGINPESSOAL.Checked;
  memQuery.Enabled        := rbQuery.Checked;
end; 


procedure TfrmExportacaoSenhas.rbTodosClick(Sender: TObject);
begin
  inherited;
  edtLOGINPESSOAL.Enabled := rbLOGINPESSOAL.Checked;
  memQuery.Enabled        := rbQuery.Checked;
end;


procedure TfrmExportacaoSenhas.rbQueryClick(Sender: TObject);
begin
  inherited;
  edtLOGINPESSOAL.Enabled := rbLOGINPESSOAL.Checked;
  memQuery.Enabled        := rbQuery.Checked;
end; 


procedure TfrmExportacaoSenhas.FormCreate(Sender: TObject);
begin
  inherited;

  //Cria e inicializa os CtrlObjects
  WebAcesso:= TCtrlWebAcesso.Create;
  WebAcesso.Initialize( DtmBaseDados.DbBaseDados, True, cntBDE,
   cnsServer, nil, True, MsgErro );

  WebConfiguracao := TCtrlWebConfiguracao.Create;
  WebConfiguracao.InitializeAs( WebAcesso );

  //Cria o objeto de criptografia
  CMCrypto := TCMCrypto.Create;

  //Seleciona os dados de configuração do sistema
  CdsWebConfiguracao.Data := WebConfiguracao.SelecionaWebConfiguracao;

  //Se não houverem dados de confuguração, fecha a janela
  if CdsWebConfiguracao.IsEmpty then
  begin
    ShowMessage('Não é possível exportar senhas enquanto o sistema não for configurado.');
    Close;
  end;

  //Verifica se as senhas são criptografadas ou não
  bSenhaCrypto := ( CdsWebConfiguracaoSENHACRIPTO.AsString = 'S' );

end;


procedure TfrmExportacaoSenhas.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end; 


procedure TfrmExportacaoSenhas.FormDestroy(Sender: TObject);
begin
  inherited;
  WebAcesso.Free;
  WebConfiguracao.Free;
  CMCrypto.Free;
end;


procedure TfrmExportacaoSenhas.rgrpTipoArquivoClick(Sender: TObject);
begin
  inherited;
  dlgSalvar.FileName := '';
end;

end.
