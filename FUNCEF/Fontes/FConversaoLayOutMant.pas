unit FConversaoLayOutMant;
{  *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  20/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
//-----------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Spin, Db, Wwdatsrc,
  DBTables, Wwquery;

type

//------------------------------------------------------------------------------
// Tipos Declarados para Manipular as Linhas do Arquivo Saída

     TSaida = Record
                      MesReferencia : String[8];
                      Mat           : String[15];
                      Nome          : String[60];

                      DataInicioBeneficio : String[10];
                      CodigoBeneficio     : String[10];
                      ValorBeneficio      : String[20];

                      TpRubrica    : String[1];
                      Sequencia    : String[2];
                      DestContabil : String[2];
                      Rubrica      : String[4];
                      Prazo        : String[3];
                      DataReferencia :String[10];

                End;

//------------------------------------------------------------------------------

  TfrmConversaoLayOutMant = class(TfrmOkCancelar)
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    edtArqProc: TEdit;
    lblPathArqProc: TLabel;
    btnArqProcessar: TSpeedButton;
    Animate1: TAnimate;
    lblBarraProgresso: TLabel;
    lblArqGravar: TLabel;
    edArqGravar: TEdit;
    spedArqGravar: TSpeedButton;
    Bevel3: TBevel;
    Bevel2: TBevel;
    grpMantenedora: TGroupBox;
    cmbMantenedora: TComboBox;
    qryAux: TwwQuery;
    procedure btnArqProcessarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbMantenedoraClick(Sender: TObject);
    procedure spedArqGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  ValorBeneficio  :Double;

  Function VerificaArquivo(Arquivo : String):Boolean;

  Procedure ConversaoPMPP;
  Procedure ConversaoCaixaSeguros;

  public
    { Public declarations }
  end;

var
  frmConversaoLayOutMant: TfrmConversaoLayOutMant;

  // Variaveis Declaradas para Manipular Dados

  LRegPMPP       : TSaida;
  LRegCxSeguros  : TSaida;

implementation

Uses uDataBAse, UMensErro,  DBaseDados, UModuloFuncef, uSistema;

Var
  wArquivoImportacao, wArquivoGravacao :TextFile;
  wLinha:String;

{$R *.DFM}


Function TfrmConversaoLayOutMant.VerificaArquivo(Arquivo : String):Boolean;
begin
  Result := True;
   // Testa se Arquivo Especificado Existe
  If Not (FileExists(edtArqProc.Text)) Then Begin
    ShowMessage('Arquivo não Existe ou Inválido ...');
    edtArqProc.SetFocus;
    Result := False;
  End;
end;

procedure TfrmConversaoLayOutMant.btnArqProcessarClick(Sender: TObject);
begin
  inherited;
  // Abre a Pesquisa e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edtArqProc.Text := UpperCase(OpenDialog1.FileName);
  End Else Begin

  End;
end;

procedure TfrmConversaoLayOutMant.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not VerificaArquivo(edtArqProc.text) then exit;

  Case cmbMantenedora.ItemIndex of
  0:  // pmpp
    ConversaoPMPP;
  1:  // CaixaSeguros
    ConversaoCaixaSeguros;
  end;
end;

procedure  TfrmConversaoLayOutMant.ConversaoPMPP ;
Var
  Aux,Matricula : string;
  Ini : TTime;
  Contador : Integer;
begin
  Try
 // Seta Arquivo, a Variavel ...
    AssignFile(wArquivoImportacao, edtArqProc.Text);
// Abre Arquivo para Leitura
    Reset(wArquivoImportacao);
  Except
    ShowMessage('Erro ao abrir Arquivo...');
    Exit;
  End;

  Try
  // Seta Arquivo, a Variavel ...
   AssignFile(wArquivoGravacao, edArqGravar.Text);
  // Abre Arquivo para Gravação
   Rewrite(wArquivoGravacao);
  Except
    ShowMessage('Erro ao abrir Arquivo...');
    Exit;
  End;

  // Liga Animate

  lblBarraProgresso.Visible  :=True;
  lblBarraProgresso.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;

  { Leitura dos Dados Fora do While }
  Readln(wArquivoImportacao,wLinha);

// Inicia Processamento
   While trim(wLinha) <> ''  do begin

   { Processa Registros }

    LRegPMPP.MesReferencia := Copy(wLinha,40,4)+ '/' + Copy(wLinha,44,2);
    LRegPMPP.Mat       := Copy(wLinha,1,6) + '         ' ;

    ValorBeneficio            := (StrToFloat(Copy(wLinha,15,11))/100);
    LRegPMPP.ValorBeneficio   := FloatToStr(ValorBeneficio);

    LRegPMPP.DestContabil     := Copy(wLinha,13,2);
    LRegPMPP.Sequencia        := Copy(wLinha,11,2);
    LRegPMPP.DataReferencia   := Copy(wLinha,40,8); // AAAAMMD
    LRegPMPP.Rubrica          := Copy(wLinha,7,4);

    //Pesquisa Nome Participante ou Dependente pela Matricula

    Matricula := Copy(wLinha,1,6);
    With QryAux Do begin
     Close;
     Sql.Clear;

     Sql.Add(' SELECT P.NOME AS NOME     ' +
             ' FROM DEPENTIT D, PESSOA P ' +
             ' WHERE D.MATRICULA LIKE'''+ Trim(Matricula) + '%''' +
             ' AND   D.IDPESSOA = P.IDPESSOA    ' );

     Open;
    End;

    //Preenche com espaço restante
    LRegPMPP.Nome := qryAux.FieldByName('NOME').AsString+
                     STRINGOFCHAR(' ',60-LENGTH(qryAux.FieldByName('NOME').AsString));

   { Gravar no Novo Registro }
     wLinha :=  PreparaStr(LRegPMPP.MesReferencia       , 7)+
                PreparaStr(LRegPMPP.Mat                 , 15)+
                PreparaStr(LRegPMPP.Nome                , 60)+
                PreparaStr(LRegPMPP.DataInicioBeneficio , 10)+
                PreparaStr(LRegPMPP.CodigoBeneficio     , 10)+
                PreparaStr(LRegPMPP.ValorBeneficio      , 20)+
                PreparaStr(LRegPMPP.Rubrica             ,  4);


   WriteLn(wArquivoGravacao,wLinha);
   { Leitura dos Dados }
   Readln(wArquivoImportacao,wLinha);

   Inc(Contador);
  End;

  { Fecha Arquivos}
  closeFile(wArquivoGravacao);
  closeFile(wArquivoImportacao);

     // Desliga Animate
  lblBarraProgresso.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;

  // Mostra Tempo da Importação
  Application.ProcessMessages;
  MsgDlg('Inicio.:   '+TimeToStr(Ini) +#13+
         'Final .:   '+TimeToStr(Time)+#13+
         '             ---------------'+#13+
         'Tempo .: '+TimeToStr(Time-Ini)+
         '  (Numero de Registros.: '+IntToStr(Contador)+')',

         'Importação OK',MtInformation,[MbOk],0);

end;

procedure TfrmConversaoLayOutMant.cmbMantenedoraClick(Sender: TObject);
begin
  inherited;
   grpMantenedora.Caption := 'Mantenedora  ' + cmbMantenedora.Text ;
end;

procedure  TfrmConversaoLayOutMant.ConversaoCaixaSeguros ;
Var
  Aux : string;
  Ini : TTime;
  Contador : Integer;
begin

  Try
    AssignFile(wArquivoImportacao, edtArqProc.Text);
    Reset(wArquivoImportacao);
  Except
    ShowMessage('Erro ao abrir Arquivo...');
    Exit;
  End;

  Try
   AssignFile(wArquivoGravacao, edArqGravar.Text);
   Rewrite(wArquivoGravacao);
  Except
    ShowMessage('Erro ao abrir Arquivo...');
    Exit;
  End;

  lblBarraProgresso.Visible  :=True;
  lblBarraProgresso.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  Contador:=0;
  Ini :=Time;

  Readln(wArquivoImportacao,wLinha);

  While ( (trim(wLinha) <> '') And (StrToInt(Copy(wLinha,1,1)) = 0)) do
  begin
     LRegCxSeguros.MesReferencia := '2001/12';

     LRegCxSeguros.Mat       := Copy(wLinha,2,7);
     LRegCxSeguros.Nome      := Copy(wLinha,9,40);

     if StrToInt(Copy(wLinha,53,2)) >= 40
     then LRegCxSeguros.DataInicioBeneficio := Copy(wLinha,49,2)+'/'+Copy(wLinha,51,2)+'/19'+Copy(wLinha,53,2)
     else LRegCxSeguros.DataInicioBeneficio := Copy(wLinha,49,2)+'/'+Copy(wLinha,51,2)+'/20'+Copy(wLinha,53,2);

     LRegCxSeguros.CodigoBeneficio     := Copy(wLinha,74,2);

     ValorBeneficio                    := (StrToFloat(Copy(wLinha,80,12))/100);

     LRegCxSeguros.ValorBeneficio      := FloatToStr(ValorBeneficio);

     LRegCxSeguros.Rubrica := Copy(wLinha,74,4);

     wLinha :=  PreparaStr(LRegCxSeguros.MesReferencia       , 7)+
                PreparaStr(LRegCxSeguros.Mat                 , 15)+
                PreparaStr(LRegCxSeguros.Nome                , 60)+
                PreparaStr(LRegCxSeguros.DataInicioBeneficio , 10)+
                PreparaStr(LRegCxSeguros.CodigoBeneficio     , 10)+
                PreparaStr(LRegCxSeguros.ValorBeneficio      , 20)+
                PreparaStr(LRegCxSeguros.Rubrica             ,  4);

     WriteLn(wArquivoGravacao,wLinha);
     Readln(wArquivoImportacao,wLinha);
     Inc(Contador);
  End;

  closeFile(wArquivoGravacao);
  closeFile(wArquivoImportacao);

  lblBarraProgresso.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;

  // Mostra Tempo da Importação
  Application.ProcessMessages;
  MsgDlg('Inicio.:   '+TimeToStr(Ini) +#13+
         'Final .:   '+TimeToStr(Time)+#13+
         '             ---------------'+#13+
         'Tempo .: '+TimeToStr(Time-Ini)+
         '  (Numero de Registros.: '+IntToStr(Contador)+')',

         'Importação OK',MtInformation,[MbOk],0);
end;

procedure TfrmConversaoLayOutMant.spedArqGravarClick(Sender: TObject);
begin
  inherited;
   // Abre a Gravação e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edArqGravar.Text := UpperCase(OpenDialog1.FileName);
  End Else Begin
//    ShowMessage('Arquivo Inválido ');
  End;
end;



procedure TfrmConversaoLayOutMant.FormCreate(Sender: TObject);
begin
  inherited;

   //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  end;

end.