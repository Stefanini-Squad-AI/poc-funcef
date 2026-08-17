unit fExecImportaLancamento;

// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************

interface

uses
  Windows, Messages, uVerificaPreenchimento,SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, uMensErro, uSistema, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, uCtrlPlanPrevContabPatro, Buttons, FProgresso, uDbHstMovCota, uCmDbObject, dBaseDados, TB97Tlbr, uCtrlHstMovCota, TB97, fcLabel, ComCtrls, ExtCtrls;

type
  TfrmExecImportaLancamento = class(TfrmWizardMT)
    Label1: TLabel;
    edArqTxtImp: TEdit;
    btProcuraArqTxt: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BuscaArqTxt: TOpenDialog;
    Label2: TLabel;
    edArqTxtErro: TEdit;
    btExcluiArqTxt: TSpeedButton;
    BuscaArqTxtErr: TOpenDialog;
    btBuscaArqTxtErr: TSpeedButton;
    ListErros: TListBox;
    Label3: TLabel;
    ListArquivo: TListBox;
    Bevel1: TBevel;
    ListExcecao: TListBox;
    SalvarArqErro: TSaveDialog;
    btSalvarArqErro: TSpeedButton;
    procedure btProcuraArqTxtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btBuscaArqTxtErrClick(Sender: TObject);
    procedure btExcluiArqTxtClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSalvarArqErroClick(Sender: TObject);
  private
    { Private declarations }

    CtrlHstMovCota          : TCtrlHstMovCota;
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    procedure MensErroMt(sMsgInfo: string);

    function  ExcluiArquivo     (const Arquivo : string): Boolean;
    procedure AnalizaArquivoTxt;
    function  VerificaErroCampo (const iLimite,iIndice,iInicio,iFim :integer) : Boolean;
    function  ValidaIdCampo     (const iIndice,iInicio,iFim: integer): Boolean;
    function  VerificaErroData  (const indice: integer): Boolean;
    function  VerificaErroValor (const iIndice,iInicio,iFim: integer): Boolean;
    function  VerificaPreenchimento : Boolean;
    function  RetornaId             (const iIndice,iInicio,iFim: integer): integer;
    function  RetornaData           (const iIndice,iInicio,iFim: integer): TDate;
    function  RetornaValor          (const iIndice,iInicio,iFim: integer): Double;

  public
    { Public declarations }
  end;

var
  frmExecImportaLancamento: TfrmExecImportaLancamento;

implementation

{$R *.DFM}

procedure TfrmExecImportaLancamento.btProcuraArqTxtClick(Sender: TObject);
begin
  inherited;
  if BuscaArqTxt.Execute then
   edArqTxtImp.Text := BuscaArqTxt.FileName;
end;

procedure TfrmExecImportaLancamento.FormCreate(Sender: TObject);
begin
  CtrlHstMovCota  :=  TCtrlHstMovCota.Create;
  CtrlHstMovCota.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                             MensErroMT);

  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(CtrlHstMovCota);

        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        //edArqTxtErro.Text := 'C:\CMERR'+ FormatDateTime('ddmmyyhhmm".txt"',now);
        edArqTxtErro.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +'\CMERR '+ FormatDateTime('ddmmyyhhmm".txt"',now);


  inherited;

end;

procedure TfrmExecImportaLancamento.btBuscaArqTxtErrClick(Sender: TObject);
begin
  inherited;
  if BuscaArqTxtErr.Execute then begin
    edArqTxtErro.Text := BuscaArqTxtErr.FileName;
  end;
end;


function TfrmExecImportaLancamento.ExcluiArquivo(
  const Arquivo: string): Boolean;
begin
  Result := false;
  if MsgDlg('Deseja realmente excluir o arquivo selecionado?',Sistema.NomeAplicativo,mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
     if FileExists(Arquivo) then begin
       DeleteFile(Arquivo);
       Result := True;
     end else MsgDlg('O arquivo especificado não existe...',Sistema.NomeAplicativo,mtWarning,[mbOk],0);
  end;
end;


procedure TfrmExecImportaLancamento.btExcluiArqTxtClick(Sender: TObject);
begin
  inherited;
  if ExcluiArquivo(edArqTxtErro.Text) then

        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        //edArqTxtErro.Text := 'C:\CMERR'+ FormatDateTime('ddmmyyhhmm".txt"',now);
        edArqTxtErro.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +'\CMERR'+ FormatDateTime('ddmmyyhhmm".txt"',now);

end;


procedure TfrmExecImportaLancamento.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if ExcluiArquivo(edArqTxtImp.Text) then
  edArqTxtImp.Clear;
end;

procedure TfrmExecImportaLancamento.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  try
    if VerificaPreenchimento then begin
      Screen.Cursor := crSQLWait;
      ListArquivo.Items.LoadFromFile(edArqTxtImp.Text);
      PagControle.ActivePageIndex := PagControle.ActivePageIndex + 1;
      // o change do page control somente é executado se o usuário clicar na tab
      // como aqui a tab não é visível é necessário forçar o método
      PagControle.OnChange(self);
      AnalizaArquivoTxt;
      if ListExcecao.Items.Count <> 0 then
        ListExcecao.Items.SaveToFile(edArqTxtErro.Text)
      else  MsgDlg('Processo concluído com sucesso!',Sistema.NomeAplicativo,mtInformation,[mbOk],0);
      btnConfirmar.Enabled := False;
      Screen.Cursor := crDefault;
    end;
  except
    btnConfirmar.Enabled := False;
    Screen.Cursor := crDefault;
    MsgDlg('O arquivo especificado não é válido!',Sistema.NomeAplicativo,mtWarning,[mbOk],0);
  end;

end;

procedure TfrmExecImportaLancamento.AnalizaArquivoTxt;
var
i,Posicao, iIdAtivoCota,iIdCotaTipoOper,iIdPlanoPrev,iIdPatro: integer;
fValor: Double;
SequenceIDCotaImportacao: integer;
dData : TDateTime;

begin
   SequenceIDCotaImportacao := CtrlHstMovCota.GetSequenceIdCotaImportacao;
   posicao := 0;
   ListErros.Clear;
   frmProgresso.MostraFormProgresso('Aguarde o processamento',false,false,True,0,100);

   for i := 0 to ListArquivo.Items.Count - 1 do begin

     //  Analizando o tamanho das linhas
     if Length(ListArquivo.Items.Strings[i]) > 62 then begin
       ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + ' =>   ''Linha maior que o tamanho estabelecido''');
       ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);
     end else if Length(ListArquivo.Items.Strings[i]) < 62 then begin
       ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + '  =>  ''Linha menor que o tamanho estabelecido''');
       ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);
     end else


     //  analizando o 1º campo IDATIVOCOTA. Tam: 1-8
     if VerificaErroCampo(8,i,1,8) then begin
       ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + '  =>  ''Campo do ATIVO está nulo''');
       ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);
     end else if not ValidaIdCampo(i,1,8) then begin
       ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + '  =>  ''ATIVO inválido''');
       ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);
     end else


     //  analizando o 2º campo IDCOTATIPOOPER. Tam: 9-16
     if VerificaErroCampo(8,i,9,16) then begin
       ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + '  =>  ''Campo OPERAÇÂO DE RECEITA DE COTA está nulo''');
       ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);
     end else


     //  analizando o 3º campo IDPLANOPREV. Tam: 17-24
     if VerificaErroCampo(8,i,17,24) then begin
       ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + '  =>  ''Campo PLANO PREVIDENCIÁRIO CONTÁBIL está nulo''');
       ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);
     end else


     //  analizando o 4º campo IDPATRO. Tam: 25-32
     if VerificaErroCampo(8,i,25,32) then begin
       ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + '  =>  ''Campo OPERAÇÂO DE RECEITA DE COTA está nulo''');
       ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);

     //  Validando Patro/Plano
     end else if not CtrlHstMovCota.ValidaPlanoPatro(RetornaId(i,17,24),RetornaId(i,25,32)) then begin
       ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + '  =>  ''Plano/Patro inválidos!''');
       ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);
     end else


     //  analizando o 5º campo DATA. Tam: 33-42  Formato = dd/mm/yyyy
     // OBS: as mensagems de erro do List são inseridas nesta função
     if VerificaErroData(i) then

     //  analizando o 6º campo VALOR. Tam: 43-62  Formato numérico (17.2)
     //  Verificando se o campo está nulo...
     if VerificaErroCampo(20,i,43,62) then begin
       ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + '  =>  ''Campo VALOR está nulo''');
       ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);

     // Verificando erros no campo...
     end else if  VerificaErroValor(i,43,62) then begin
       ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + '  =>  ''Campo VALOR está inválido''');
       ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);
     end else begin


        //    Caso a linha seja válida, é passado para as variáveis os valores dos campos
        iIdAtivoCota    := RetornaId(i,1,8);
        iIdCotaTipoOper := RetornaId(i,9,16);
        iIdPlanoPrev    := RetornaId(i,17,24);
        iIdPatro        := RetornaId(i,25,32);
        dData           := RetornaData(i,33,42);
        fValor          := RetornaValor(i,43,62);


       //  Grava os campos na tabela HSTMOVCOTA, caso sejam válidos
       if not CtrlHstMovCota.GravaLoteHstMovCota(iIdAtivoCota,iIdCotaTipoOper,iIdPlanoPrev,iIdPatro,SequenceIDCotaImportacao,fValor,dData) then begin
          //  Caso haja duplicidade de registro, é infomado a mensagem de erro
          ListErros.Items.Add('Erro na linha ' +  IntToStr(i+1) + '  =>  ''Registro já inserido no arquivo''');
          ListExcecao.Items.Add('Linha ' + IntToStr(i+1)+ ' ' + ListArquivo.Items.Strings[i]);
       end;
     end;

     // Incrementa uma posição no progresso
     Inc(posicao);
     frmProgresso.AndaFormProgresso(posicao,ListArquivo.Items.Count);
   end;
   frmProgresso.EscondeFormProgresso;
end;



function TfrmExecImportaLancamento.VerificaErroCampo(const iLimite,iIndice,iInicio,
  iFim: integer): Boolean;
Var
iCampoZerado, i : integer;
sTexto: string;

begin
  Result := false;
  iCampoZerado := 0;
  sTexto := ListArquivo.Items.Strings[iIndice];

  for i := iInicio to iFim do begin
    if sTexto[i] = '0' then
       Inc(iCampoZerado);
  end;

  if iCampoZerado = iLimite then
  Result :=  True;

end;

function TfrmExecImportaLancamento.VerificaErroData(
  const indice: integer): boolean;

var
Item,Data : string;

begin
  Result := false;
  Data := ListArquivo.Items.Strings[indice];

  //  Verificando o dia
  Item := Data[33] + Data[34];
  if StrToInt(Item) > 31 then begin
    ListErros.Items.Add('Erro na linha ' +  IntToStr(indice+1) + '  =>  ''O DIA do campo DATA está inválido''');
    ListExcecao.Items.Add('Linha ' + IntToStr(indice+1)+ ' ' + Data);
  end else begin
    //  Verificando o mês
    Item := Data[36] + Data[37];
    if StrToInt(Item) > 12 then begin
      ListErros.Items.Add('Erro na linha ' +  IntToStr(indice+1) + '  =>  ''O MÊS do campo DATA está inválido''');
      ListExcecao.Items.Add('Linha ' + IntToStr(indice)+ ' ' + Data);
    end else begin
      //  Verificando o ano
      Item := Data[39] + Data[40] + Data[41] + Data[42];
      if StrToInt(Item) < 1900  then begin
        ListErros.Items.Add('Erro na linha ' +  IntToStr(indice+1) + '  =>  ''O ANO do campo DATA está inválido''');
        ListExcecao.Items.Add('Linha ' + IntToStr(indice)+ ' ' + Data);
      end else Result := True;
    end;
  end;



end;

function TfrmExecImportaLancamento.VerificaPreenchimento: Boolean;
begin
 Result := false;
 try
    if edArqTxtImp.Text  = '' then
      raise EValidacao.CreateVal('É necessário informar um arquivo de importação!',edArqTxtImp)
    else if not FileExists(edArqTxtImp.Text) then
      raise EValidacao.CreateVal('O arquivo de importação especificado não existe!',edArqTxtImp)
    else if FileExists(edArqTxtErro.Text) then
      raise EValidacao.CreateVal('Já existe o arquivo de erro especificado!',edArqTxtErro);

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

procedure TfrmExecImportaLancamento.MensErroMt(sMsgInfo: string);
begin
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;


function TfrmExecImportaLancamento.ValidaIdCampo(
  const iIndice,iInicio,iFim: integer): Boolean;
//==============================================================================
//       Esta função verifica se o Ativo que está em foco é realmente um Ativo
//  lançado manualmente.
//
//
//==============================================================================
var
sTexto, sIdCampo: string;
i: integer;

begin
  Result := false;
  sTexto := ListArquivo.Items.Strings[iIndice];

  for i := iInicio to iFim do begin
    sIdCampo := sIdCampo + sTexto[i];
  end;

  if CtrlHstMovCota.ValidaIdCampo(StrToInt(sIdCampo)) then
  Result := true;

end;


function TfrmExecImportaLancamento.RetornaData(const iIndice, iInicio,
  iFim: integer): TDate;
var
Texto,Data: string;
i: integer;

begin
  Texto := ListArquivo.Items.Strings[iIndice];

  for i := iInicio to iFim do begin
    Data := Data + Texto[i];
  end;
  Result := StrToDate(Data);
end;


function TfrmExecImportaLancamento.RetornaId(const iIndice, iInicio,
  iFim: integer): integer;
var
Texto,Id: string;
i: integer;

begin
  Texto := ListArquivo.Items.Strings[iIndice];

  for i := iInicio to iFim do begin
   Id := Id + Texto[i];
  end;

  Result := StrToInt(Id);

end;


function TfrmExecImportaLancamento.RetornaValor(const iIndice, iInicio,
  iFim: integer): Double;
var
Texto,Valor: string;
i: integer;

begin
  Texto := ListArquivo.Items.Strings[iIndice];

  for i := iInicio to iFim do begin
    if Texto[i] = '.' then
      Valor := Valor + ','
    else Valor := Valor + Texto[i];
  end;


  Result := StrToCurr(Valor);

end;



function TfrmExecImportaLancamento.VerificaErroValor(const iIndice, iInicio,
  iFim: integer): Boolean;
var
i: integer;
Texto: string;

begin
  Texto := ListArquivo.Items.Strings[iIndice];

  for i := iInicio to iFim do begin
    if Texto[i] = '-' then begin
      Result := True;
      Exit;
    end else if Texto[i] = ' ' then begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;


procedure TfrmExecImportaLancamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlHstMovCota);
  FreeAndNil(CtrlPlanPrevContabPatro);
end;

procedure TfrmExecImportaLancamento.btSalvarArqErroClick(Sender: TObject);
begin
  inherited;
  if ListErros.Items.Count <> 0 then begin
    if SalvarArqErro.Execute then
      ListErros.Items.SaveToFile(SalvarArqErro.FileName);
  end else MsgDlg('A lista de erros está vazia!',Sistema.NomeAplicativo,mtWarning,[mbOk],0); 
end;

end.
