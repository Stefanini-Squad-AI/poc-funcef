{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Bradesco           }
{   BRADESCO - IDMODELOSCNAB = 1/R                      }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                27/11/2002 - Fabio Barros              }
//               02/10/2003 - andre tavares - pendência 15154
{                13/04/2004 -   André Tavares - pendência 16136 }
{                13/04/2004 -   André Tavares - pendência 16137 }
{                                                       }
{*******************************************************}

unit FCobrRemessaBradescoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr;

type
  TFrmCobrRemessaBradescoMT = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    pnlFundo: TPanel;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    bbtnCancelar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RgAceite: TRadioGroup;
    EdtNumeEmpresa: TEdit;
    edtNossoNumero: TEdit;
    EdtNomeEmpresa: TEdit;
    RgPapeleta: TRadioGroup;
    RgDebito: TRadioGroup;
    RgAvisoDebito: TRadioGroup;
    Label3: TLabel;
    CmbEspecie: TComboBox;
    Label4: TLabel;
    CmbInstrucaoI: TComboBox;
    CmbInstrucaoII: TComboBox;
    Label5: TLabel;
    Label7: TLabel;
    EdtJuros: TEdit;
    Label8: TLabel;
    EdtMensagem1: TEdit;
    Label1: TLabel;
    EdtMensagem2: TEdit;
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCobrRemessaBradescoMT: TFrmCobrRemessaBradescoMT;

implementation

uses uCMDialogs, uIntBancoManager, uString, uContaBancariaMT;

{$R *.DFM}

procedure TFrmCobrRemessaBradescoMT.bbtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmCobrRemessaBradescoMT.bbtnConfirmarClick(Sender: TObject);
Var ArquivoRemessa: TextFile;
    iNumSeq: Integer;
    sTipoInsc, sAceite, sPapeleta, sCodigoBanco, sInstrucao1,sInstrucao2: String;
    Juros,rNossoNumero: Real;
//inicio - andre tavares - pendência 15154
    sAvisoDebito : string;
//fim - andre tavares - pendência 15154
begin
  If Trim(CmbEspecie.Text) = ''  Then
  Begin
     MsgAviso('Favor indicar a espécie da cobrança','Atenção');
     CmbEspecie.SetFocus;
     Exit;
  End;

  Try
    If Trim(CmbInstrucaoI.Text) = '' Then
        sInstrucao1 := '00'
     Else
        sInstrucao1 := Copy(CmbInstrucaoI.Items[CmbInstrucaoI.ItemIndex],1,2);

     If Trim(CmbInstrucaoII.Text) = '' Then
        sInstrucao2 := '00'
     Else
        sInstrucao2 := Copy(CmbInstrucaoII.Items[CmbInstrucaoII.ItemIndex],1,2);


     iNumSeq := 1;
     sTipoInsc := '02';
     Case RgAceite.ItemIndex of
          0: sAceite := 'A';
          1: sAceite := 'N';
     End;

     Try
      // Correção do Valor de Juros, antes não testava se o mesmo estava preechido ou não
      // Correção dia 02/09/98
      If Trim(EdtJuros.Text) = '' Then
         Juros := 0
      Else
         Juros := StrToFloat(EdtJuros.Text);

     Except
      Juros := 0;
     End;

     edtNossoNumero.Text := IntBancoManager.CdsTexto.fieldByName('NOSSONUMERO').asString;
     //Opçao de gerar nosso número ou Reimprimir o Arquivo
     If (StrToFloat(Copy(edtNossoNumero.Text,1,12)) <> 0) Then
        rNossoNumero := StrToFloat(Copy(edtNossoNumero.Text,2,11)) + 1
     Else
        rNossoNumero := 0;

     IntBancoManager.CdsTexto.Open;

     AssignFile(ArquivoRemessa, IntBancoManager.sNomeArquivo);
     ReWrite(ArquivoRemessa);

     IntBancoManager.CdsTexto.First;
     //Header
     WriteLn(ArquivoRemessa,Concat('0',
                                   '1',
                                   'REMESSA',
                                   '01',
                                   AE('COBRANCA',15),
                                   ZD(IntBancoManager.CdsTexto.FieldByName('NUMRAZAOCC').AsString ,20),
                                   AE(Copy(IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString,1,30),30),
                                   '237',
                                   AE('BRADESCO',15),
                                   REMOVEBARRAS(DateToStr(Date)),
                                   SPC(8),
                                   'MX',
                                   ZD(IntBancoManager.CodArquivoRemessa,7),
                                   SPC(277),
                                   ZD(IntToStr(iNumSeq),6)));
     Inc(iNumSeq);


//inicio - andre tavares - pendência 15154
    if RgDebito.ItemIndex = 1 then
      sAvisoDebito := ' '
    else
    begin
      if RgAvisoDebito.ItemIndex in [0, 1] then
        sAvisoDebito := '1'
      else
        sAvisoDebito := '2';
    end;
//fim - andre tavares - pendência 15154


     //Transação
     While Not IntBancoManager.CdsTexto.Eof Do
     Begin
         If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
            sTipoInsc := '01'
         Else
            sTipoInsc := '02';

         if rNossoNumero = 0 Then
            IntBancoManager.sNossoNumero := Spc(12)
         Else
            IntBancoManager.sNossoNumero := ModuloNovo(9,11,7,11,ZD(FloatToStr(rNossoNumero),11));

         {Gustavo - 13/03/2002}
         sPapeleta := 'N';
         sCodigoBanco := '237';

         If RgDebito.ItemIndex =  1 Then
         Begin
           sPapeleta := ' ';
           sCodigoBanco := '000'
         End;
         {Gustavo - 13/03/2002}

         if trim(IntBancoManager.sCodOcorrencia) = '' then
           IntBancoManager.sCodOcorrencia := '01';
            
         WriteLn(ArquivoRemessa,
                 Concat('1', {codigo de registro}
                        ZD('0',5),{agencia do de debito}
                        ' ', {digito da agencia de debito}
                        ZD('0',5),{razão da conta corrente}
                        ZD('0',7),{conta corrente}
                        ' ', {digito da conta corrente}
                        AE(EdtNumeEmpresa.Text,17), {codigo da empresa}
                        AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDOCUMENTO').AsString,25), {num controle do participante}
                        sCodigoBanco, {codigo do banco}
                        '00000',  {Zeros}
                        Copy(IntBancoManager.sNossoNumero,1,12), {nosso numero}
                        ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),10), {valor do desconto}
                        IntToStr(RgPapeleta.ItemIndex + 1), {condicao para emissão de papeleta}
                        sPapeleta, {Identificação para emissão de papelata}
                        Spc(10),
                        ' ', {Indicação de rateio de crédito}
//início - andre tavares - pendência 15154
//                        IntToStr(RgAvisoDebito.ItemIndex + 1), {enderecamento para aviso de debito}
                        sAvisoDebito, {enderecamento para aviso de debito}
//fim - andre tavares - pendência 15154
                        Spc(2),
//início -andre tavares - 13/04/2004 - pendência 16137
//                        '01', {identificacao da ocorrencia}
                        IntBancoManager.sCodOcorrencia,
//início -andre tavares - 13/04/2004 - pendência 16137
                        AE(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString,10), {num doc}
                        REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), {data venciento}
                        ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), {valor}
                        '000', {banco encarregado da cobranca}
                        '00000', {agencia depositaria}
                        Copy(CmbEspecie.Items[CmbEspecie.ItemIndex],1,2), {especie do titulo}
                        SAceite, {aceite}
                        REMOVEBARRAS(DateToStr(Date)), {data emissao}
                        sInstrucao1, {instrucao I}
                        sInstrucao2, {instrucao II}
                        ZD(RemoveVirgulas((Juros * IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat)/100,2),13), {juros por dia}
                        REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), {Data limite desconto}
                        ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), {valor do desconto}
                        ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOROM').AsFloat,5),13), {qtde moeda}
                        ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), {valor do desconto}
                        sTipoInsc, {tipo inscricao do sacado}
                        ZD(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), {nº inscricao do sacao}
                        AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,40),
                        AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString + ' ' +
                                IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,1,40),40),
                        AE(EdtMensagem1.Text,12), {primeira mensagem}
                        ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                        AE(EdtMensagem2.Text,60), {segunda mensagem}
                        Zd(IntToStr(iNumSeq),6)));
         Inc(iNumSeq);

         //Opçao gerar nosso número ou Reimprimir o Arquivo
         If (StrtoFloat(Copy(edtNossoNumero.Text,1,12)) <> 0) Then
         Begin
            if not IntBancoManager.AtualizaDoc('1','S',ZD(IntBancoManager.sNossoNumero,12),DateToStr(Date),
                        IntBancoManager.CodArquivoRemessa,
                        IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,
                        IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
               raise Exception.Create(IntBancoManager.MessageInfo);
            rNossoNumero := rNossoNumero + 1;
         End;

         If (Not IntBancoManager.GeraNossoNumero) And (StrToFloat(Copy(edtNossoNumero.Text,1,12)) = 0) Then
         begin
            if not IntBancoManager.AtualizaDoc('1','S','',DateToStr(Date),
                        IntBancoManager.CodArquivoRemessa,
                        IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,
                        IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
               raise Exception.Create(IntBancoManager.MessageInfo);
         end;

         IntBancoManager.CdsTexto.Next;
     End;

     //Trailer
     WriteLn(ArquivoRemessa,Concat('9',SPC(393),Zd(IntToStr(iNumSeq),6)));

     CloseFile(ArquivoRemessa);

     IntBancoManager.UltNossoNumero := '9'+ZD(FloatToStr(rNossoNumero),11);
     IntBancoManager.UltCodArquivoGerado := IntBancoManager.CodArquivoRemessa;

     IntBancoManager.MostraArquivo;
  Except
     On E:Exception Do
     Begin
       MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message,'Atenção');
       CloseFile(ArquivoRemessa);
       Abort;
     End;
  End;
  ModalResult := MrOk;
end;

procedure TFrmCobrRemessaBradescoMT.FormCreate(Sender: TObject);
begin
   IntBancoManager.CdsEmpresa.Open;
   EdtNomeEmpresa.Text := IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString;
   EdtNumeEmpresa.Text := IntBancoManager.NumeEmpresaBanco;

   if IntBancoManager.NossoNumero = '0' then
     EdtNossoNumero.Text := ZD(IntBancoManager.NossoNumero,12)
   else
     EdtNossoNumero.Text := Copy(IntBancoManager.NossoNumero,1,12);

   EdtJuros.Text := IntBancoManager.ValorJuros;
end;


end.
