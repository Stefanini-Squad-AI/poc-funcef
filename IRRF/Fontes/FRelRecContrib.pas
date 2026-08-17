unit FRelRecContrib;

//***************************************************************************************
//Nº SOL: 270069
//Nº KTN/PPM: 1330205
//Data da Alteração: 15/03/2016
//Alteração Form: Alteração da Funcionalidade de acordo com o SOL
//Responsável: William Moreira da Silva
//Descrição: Erro ao gerar o relatorio de contribuições
//***************************************************************************************
//Nº SOL: 242573/16949
//Nº KTN/PPM: 979572
//Data da Alteração: 04/09/2015
//Alteração Form: Alteração da Funcionalidade de acordo com o SOL
//Responsável: Robson Andrade
//Descrição: Gerar Relatório de Recebimento de Contribuições e Resgates
//**************************************************************************************//***************************************************************************************
//Nº SOL: 242573/16949
//Nº KTN/PPM: 667436
//Data da Alteração: 24/02/2015
//Alteração Form: Criação da funcionalidade
//Responsável: Edilaine Ferraresi
//Descrição: Gerar Relatório de Recebimento de Contribuições e Resgates
//**************************************************************************************


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, uMensErro,
  UFuncoesUteis, Spin, ImgList, Grids, Wwdbigrd, Wwdbgrid, Wwdbgrd2,
  DBTables, Db, Wwquery, TypInfo, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, uCtrlRelRecContrib, uCtrlGeraGPS, DBaseDados, fAguarde;

type
    { Inicio - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    TIndexMes         = (Janeiro, Fevereiro, Marco,    Abril,   Maio,     Junho,
                         Julho,   Agosto,    Setembro, Outubro, Novembro, Dezembro);
    TArquivo          = (aResgate, aContribuicao );
    TGrid             = ( gPrincipal, gSecundaria);
    TPar              = ( pDefault, pIdContrib );
    TData             = ( dInicio, dFim);

    { Fim - Robson.Andrade - SOL242573 / 16949 PPM 979572 }

    TFrmRelRecContrib = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CbMesInicio: TComboBox;
    seAnoInicio: TSpinEdit;
    Label2: TLabel;
    CbMesFim: TComboBox;
    seAnoFim: TSpinEdit;
    rgTipo: TRadioGroup;
    PSelecaoContribuicoes: TPanel;
    btRetirar: TBitBtn;
    btIncluir: TBitBtn;
    btConfirmar: TBitBtn;
    dtsSelecao: TwwDataSource;
    sqlSelecao: TCMSqlParams;
    cdsSelecao: TCMClientDataSet;
    sgSecundaria: TStringGrid;
    SGPrincipal: TStringGrid;
    CDSTipoArquivo: TCMClientDataSet;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CarregaMeses(ComboMes: TComboBox; indMes: TIndexMes = Janeiro); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure CarregaGrid(sgGrid : TStringGrid; tipoGrid: TGrid; bPrimeiraVez: Boolean = False); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Procedure ApagaItensGrid(sgGrid: TStringGrid);{ Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Procedure RemoveRegistroEmBrancoDaSecundaria; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Procedure AtualizaParametro(iPar : Integer = 0; tParametro: TPar = pDefault);{ Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Procedure controlaBotao(bt: TBitBtn; sGrid: TStringGrid); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Procedure transferirDadosGrid(slSaida: TStringList; sgRecebe: TStringGrid);  { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure copiaLista(slLista: TStringList; sLinha : String ); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }


    Function  GetIndMes(indMes : TIndexMes): Integer; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Function  GetIn: String; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Function  GetAnoAtual: Integer; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Function  GetData(comboMes : TComboBox; intAno : Integer; tipoData: TData ): String;  { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Function  GetPeriodos(ComboMes: TComboBox; intAno: Integer):String; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Function  GetQuantidadePeriodos(dtInicial,dtFinal : TDate): Integer; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }

    Function  IsBissexto(iAno : Integer): Boolean; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Function  iif(bCondicao : Boolean; vSeVerdadeiro,vSeFalse: Variant):Variant; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Function  ValidaPeriodos: Boolean; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Function  Procura(sLinha: String; sGrid: TStringGrid): Boolean; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }

    Function  LerStrings(strStringRead: String; intPosicao: Integer): String; //Robson.Andrade - SOL242573 / 16949 PPM 979572
    Function  GravaStrings(strStringGravar: String; intPosicaoGravar: Integer; strNovaString: String): String;//Robson.Andrade - SOL242573 / 16949 PPM 979572
    Function  FormatarTexto(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;// Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure DesenhaTexto(Canvas : TCanvas; PosicaoX, PosicaoY : Integer; Texto : String; Alinhamento: String = 'E'; Limite : integer = 0); //Robson.Andrade - SOL242573 / 16949 PPM 979572 }

    procedure posicionaItemNaLista(intIndex : Integer; sgGrid: TStringGrid); //Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure rgTipoClick(Sender: TObject); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure SGPrincipalDrawCell(Sender: TObject; ACol, ARow: Integer;
              Rect: TRect; State: TGridDrawState); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure btIncluirClick(Sender: TObject); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure SGPrincipalSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure FormDestroy(Sender: TObject); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure sgSecundariaDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure btRetirarClick(Sender: TObject); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure sgSecundariaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure btConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  private
    FTipoDeArquivo    : TArquivo;           { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    ctrlRelRecContrib : TCtrlRelRecContrib; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    CtrlGeraGPS       : TCtrlGeraGPS;       { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Function  GetTipoDeArquivo: TArquivo;   { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    procedure SetTipoDeArquivo(tipoArquivo: TArquivo); { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    property  TipoDeArquivo : TArquivo Read GetTipoDeArquivo  Write SetTipoDeArquivo;
    { Private declarations }
  public
    arrCDS  : array of TCMClientDataSet; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    arMesAno: Array of String;           { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    sArquivo: string;                    { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    Function LerMes(arrMes : array of String; intMes : Integer): String; { Robson.Andrade - SOL242573 / 16949 PPM 979572 }
    { Public declarations }
  end;

var
  FrmRelRecContrib: TFrmRelRecContrib;
  { Inicio -  Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  Meses : Array [0..11] of string = ('Janeiro','Fevereiro','Março'   ,'Abril'  ,'Maio'    ,'Junho',
                                     'Julho'  ,'Agosto'   ,'Setembro','Outubro','Novembro','Dezembro');
  DiaMes: Array [0..11] of Integer = (  31,       28,        31,         30,      31,         30,
                                        31,       31,        30,         31,      30,         31     );
 { Fim - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  tipoArquivo  : TArquivo;    //Robson.Andrade - SOL242573 / 16949 PPM 979572
  intIndexP    : Integer;     //Robson.Andrade - SOL242573 / 16949 PPM 979572
  intIndexS    : Integer;     //Robson.Andrade - SOL242573 / 16949 PPM 979572
  slSecundaria : TStringList; //Robson.Andrade - SOL242573 / 16949 PPM 979572
  intSgSecWidthDef   : Integer;
  intSgDefColWiWidth : Integer;

  slPrinc : TStringList;     //Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  slSec   : TStringList;     //Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  slClone : TStringList;     //Robson.Andrade - SOL242573 / 16949 PPM 979572 }


implementation

uses uSistema, fTelaAut, FOpcoesExporta;

{$R *.DFM}

// ****************************************************************************************
// Implementação da função para desenhar texto com canvas
// Autor : Robson Andrade  SOL242573 / 16949 PPM 979572
// ****************************************************************************************
// ----------------------------------------------------------------------------------------
// Entrada:
// Canvas ......: Canvas do Método que originou o evento ( Ex: StringGrid.Canvas )
// PosicaoX.....: Posição dentro da linha, define a posição Horizontal da linha ( Ex: Rect.Lefth )
// PosicaoY.....: Posição dentro da linha, define a posição Vertical, altura da linha ( Ex: Rect.Top   )
// Texto........: Texto que será desenhado, escrito
// Alinhamento..: valor Default "E" - Esquerda
//                              "C" - Centro
//                              "D" - Direita
// Limite ......:  valor Deault "0" - Zero ( Se for especificado um limite, caso a string atinja o limite e ainda haja texto, será acrescentado no final ... ( 3 pontinhos )
//                 ( o LImite será igual ao margem de uma lado a outro ( Ex.: Se o Length do texto for 20 e o texto tiver length de 30, será acrescentado os ... )
// ----------------------------------------------------------------------------------------
procedure TFrmRelRecContrib.DesenhaTexto(Canvas : TCanvas; PosicaoX, PosicaoY : Integer; Texto : String; Alinhamento: String = 'E'; Limite : integer = 0);
var
  i, x : integer;
begin
  if (Limite> 0) and (Canvas.TextWidth(Texto)>limite) then
  begin
    While Canvas.TextWidth(Texto)+Canvas.TextWidth('...')>Limite do
    Texto := copy(Texto,1,length(Texto)-1);
    Texto := Texto+'...';
  end;

      if AnsiUpperCase(Alinhamento)='C' then x := PosicaoX - (Canvas.TextWidth(Texto) div 2) else
      if AnsiUpperCase(Alinhamento)='D' then x := PosicaoX - (Canvas.TextWidth(Texto)) else
      if AnsiUpperCase(Alinhamento)='E' then x := PosicaoX;

      Canvas.TextOut(X,PosicaoY,Texto);
end;

// ****************************************************************************************
// Implementação da função para incluir caracteres à esquerda ou a direita da String
// Autor : Robson Andrade  - SOL242573 / 16949 PPM 979572 }
// ****************************************************************************************
// ----------------------------------------------------------------------------------------
// Entrada:
// Texto ..............: String que deverá ser formatada ( Texto original )
// TamanhoDesejado.....: Tamanho que a string deverá se ajustar
// AcrescentarADireita.: TRUE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à direita
//                              Se o tamanho do texto for MAIOR que o desejado, eliminar últimos caracteres do texto
//                       FALSE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à esquerda
//                              Se o tamanho do texto for MAIOR que o desejado, eliminar primeiros caracteres do texto
// CaracterAcrescentar.: Carácter que deverá ser acrescentado
// Saída:
//  String Formatada com o tamanho desejado
// ----------------------------------------------------------------------------------------
Function TFrmRelRecContrib.FormatarTexto(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
{
   Texto : Texto original
   TamanhoDesejado: Tamanho que a string resultante deverá ter
   AcrescentarADireita: Indica se o carácter será acrescentado à direita ou à esquerda

}
var
   QuantidadeAcrescentar,
   TamanhoTexto,
   PosicaoInicial,
   i : integer;

begin
   case CaracterAcrescentar of
      '0'..'9','a'..'z','A'..'Z' : ;{Não faz nada}
      else
         CaracterAcrescentar := ' ';
   end;

   Texto := Trim(AnsiUpperCase(Texto));
   TamanhoTexto := Length(Texto);
{$WARNINGS OFF}
   for i := 1 to (TamanhoTexto) do
   begin
      if Pos(Texto[i],' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
      begin
         case Texto[i] of
            'Á','À','Â','Ä','Ã' : Texto[i] := 'A';
            'É','È','Ê','Ë' : Texto[i] := 'E';
            'Í','Ì','Î','Ï' : Texto[i] := 'I';
            'Ó','Ò','Ô','Ö','Õ' : Texto[i] := 'O';
            'Ú','Ù','Û','Ü' : Texto[i] := 'U';
            'Ç' : Texto[i] := 'C';
            'Ñ' : Texto[i] := 'N';
            else Texto[i] := ' ';
         end;
      end;
   end;
   QuantidadeAcrescentar := TamanhoDesejado - TamanhoTexto;
   if QuantidadeAcrescentar < 0 then
      QuantidadeAcrescentar := 0;
   if CaracterAcrescentar = '' then
      CaracterAcrescentar := ' ';
   if TamanhoTexto >= TamanhoDesejado then
      PosicaoInicial := TamanhoTexto - TamanhoDesejado + 1
   else
      PosicaoInicial := 1;

   if AcrescentarADireita then
      Texto := Copy(Texto,1,TamanhoDesejado) + StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar)
   else
      Texto := StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar) + Copy(Texto,PosicaoInicial,TamanhoDesejado);

   Result := AnsiUpperCase(Texto);
end;


{Objetivo : Substitui a string da linha original (strStringGravar), passando a posição(intPosicaoGravar) e a nova string (strNovaString)
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.GravaStrings(strStringGravar: String; intPosicaoGravar: Integer; strNovaString: String): String;
var
  Sl: TStringList;
  intCount: Integer;
begin
  Sl := TStringList.Create;
  Sl.CommaText := strStringGravar;
  Result := '';
  For intCount := 0 to Sl.Count - 1 do
  begin
    if intCount > 0 then
      Result := Result + ',';
    if intCount = intPosicaoGravar then
      Result := Result + '"' + strNovaString + '"'
    else
      Result := Result + '"' + Sl[intCount] + '"';
  end;

  FreeAndNil(Sl);
end;

{Objetivo: Ler a string que está entre aspas na linha
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.LerStrings(strStringRead: String; intPosicao: Integer): String;
var
  slLoadString: TStringList;
begin
  slLoadString := TStringList.Create;
  slLoadString.CommaText := strStringRead;

  if intPosicao > slLoadString.Count - 1 then
    Result := ''
  else
    Result := slLoadString[intPosicao];

  FreeAndNil(slLoadString);
end;

{ Objetivo :  Retornar se o ano é bissexto
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.IsBissexto(iAno : Integer): Boolean;
begin
  Result := (iAno Mod 4 = 0) and ((iAno mod 100 <> 0) or (iAno mod 400 = 0));
end;

{ Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.bbtnConfirmarClick(Sender: TObject);
var
  Sistema        : TSistema;
  sMensagem      : string;
  sDataIni       : string;
  sDataFim       : string;
  intPeriodos    : Integer;
  intCount       : Integer;
  wDia,wMes,wAno : Word;
  iMes           : Integer;
  sMes           : string;
  iAno           : Integer;
  sAnoMes        : string;
  cbTemp         : TComboBox;
begin
  inherited;
  sMensagem   := '';
  sDataIni    := GetData(CbMesInicio,seAnoInicio.Value,dInicio);   {Data inicial 00/00/0000 - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  sDataFim    := GetData(CbMesFim,seAnoFim.Value,dFim);            {Data Final   00/00/0000 - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  {Retorna a quantidade de Períodos e carrega o array com os meses - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  intPeriodos := GetQuantidadePeriodos(StrToDate(sDataIni),StrToDate(sDataFim));

  { Tipo de arquivo que será gerado }
  sArquivo := iif(rgTipo.ItemIndex = 0,'Resg.','Contrib.');

  //iif(FTipoDeArquivo                := tipoArquivo;

  {faz a validação dos períodos - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  if ValidaPeriodos then
    begin
      try
        ctrlRelRecContrib := TCtrlRelRecContrib.Create;
        ctrlRelRecContrib.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True,nil,nil,False);
        application.ProcessMessages;


        {ajusta o arrCDS para a quantidade de períodos informado - cada período é um mês - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
        SetLength(arrCDS,intPeriodos);
        For intCount := 1 to intPeriodos do
          begin
           {Decodifica a data que está dentro do array, data utilizada para fazer a leitura do ano e mês - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
            DecodeDate(StrToDate(LerMes(arMesAno,intCount - 1)),wAno,wMes,wDia);
            iMes := wMes;
            iAno := wAno;
            {Decrementa 1 no mês, pois no combo o mês de janeiro está na posição "0" - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
            Dec(iMes);
            {Cria combobox Temporários - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
            if Not Assigned(cbTemp) then
              begin
               cbTemp         := TComboBox.Create(Self);
               cbTemp.parent  := Self;
               cbTemp.Visible := False;

               {Carrega a lista com os meses - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
               CarregaMeses(CbTemp);
             end;
            {Mes Inicial e mes final são os mesmos, então posiciona no mês correspondente - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
            cbTemp.ItemIndex := iMes;


            {utiliza os itens do combo somente para retornar o mês, não tem nada a ver com o que está na tela  - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
            sMes := CbMesInicio.Items.Strings[iMes] + '/'+intToStr(iAno);
            {Exibe na tela o mês que está sendo gerado - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
            frmAguarde.Mostra('Aguarde...'+chr(13)+'Filtrando dados de '+ sArquivo + ' ref. ' + Copy(sMes,1,3)+copy(sMes,Pos('/',sMes),5));
            application.ProcessMessages;

            Inc(iMes);
            sMes := FormatarTexto(IntToStr(iMes),2,false,'0');

            sAnoMes := IntToStr(iAno)+'/'+sMes;
            {Cria o array dinâmico do ClienteDataSet - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
            arrCDS[intCount - 1] := TCMClientDataSet.Create(nil);
            case tipoArquivo of
              {Carrega o ClienteDataSet - Robson.Andrade - SOL242573 / 16949 PPM 979572 }
              aResgate      : arrCDS[intCount -1 ].data := ctrlRelRecContrib.BuscarResgate(sAnoMes,sAnoMes, GetData(CbTemp,iAno,dInicio), GetData(CbTemp,iAno,dFim));
              aContribuicao : arrCDS[intCount -1 ].data := ctrlRelRecContrib.BuscarContribuicoes(sAnoMes,sAnoMes, GetData(CbTemp,iAno,dInicio), GetData(CbTemp,iAno,dFim), GetIn);
            end;

          end;

          frmAguarde.Apaga;

          FrmOpcoesExporta := TFrmOpcoesExporta.Create(Self);
          { Robson.Andrade - SOL242573 / 16949 PPM 979572 - Inicio

          frmOpcoesExporta.dDataIni := StrToDate(sDataIni);
          frmOpcoesExporta.dDataFim := StrToDate(sDataFim);
          Passar a data que está no array arMesAno

          Robson.Andrade - SOL242573 / 16949 PPM 979572 - Fim }

          Case TipoDeArquivo of
            aResgate      : frmOpcoesExporta.tTipoRel := trResgate;
            aContribuicao : frmOpcoesExporta.tTipoRel := trContrib

          end;
          FrmOpcoesExporta.ShowModal;
          FreeAndNil(FrmOpcoesExporta);
        finally
          FreeAndNil(ctrlRelRecContrib);
          if Assigned(cbTemp) then
            FreeAndNil(cbTemp);
          if intPeriodos > 0 then
            For intCount := 1 to intPeriodos do
              if Assigned(arrCDS[intCount -1]) then
                 FreeAndNil(arrCDS[intCount -1]);
        end;


      end;

end;

{ Objetivo :  Retornar a lista de meses no combo indicado no parâmetro comboMes, se não informar o mês, o mês selecionado será "Janeiro"
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.CarregaMeses(ComboMes: TComboBox; indMes: TIndexMes = Janeiro);
var
   iCount : Integer;
begin
  //Apaga os itens do combo
  ComboMes.Items.Clear;
  //Carrega os meses
  for iCount := 0 to Length(Meses) -1 do
    ComboMes.Items.Add(Meses[iCount]);
  //Seta o Mês selecionado, se não houver passado mês inicial como parâmetro será selecionado o mÊs de janeiro (ilJaneiro Default ), caso
  //conrário o mês informado
  ComboMes.ItemIndex := GetIndMes(indMes);
end;

procedure TFrmRelRecContrib.FormCreate(Sender: TObject);
var
   wdia,
   wMes,
   wAno : Word;
   iMes : Integer;
begin
  inherited;
  self.HelpContext := 4870002;
  {Inicio - Robson.Andrade - SOL242573 / 16949 PPM 979572 }

  //Decodifica a data para pegar o mes atual
  DecodeDate(Date,wAno,wMes,wdia);
  //Carrega o mes na variável inteira, para passar como parâmetro para o enum
  iMes  := wMes;
  //Carrega o mês inicial com o mês corrente
  CarregaMeses(CbMesInicio,TIndexMes(iMes - 1));
  //Carrega o ano inicial e final com o ano corrente
  seAnoInicio.Value := GetAnoAtual;
  seAnoFim.Value    := GetAnoAtual;
  //Carrega o mês final com o mês corrente
  CarregaMeses(CbMesFim,TIndexMes(iMes - 1));
  //Seleciona o tipo de arquivo "Resgate"
  SetTipoDeArquivo(aResgate);

 {Fim - Robson.Andrade - SOL242573 / 16949 PPM 979572 }

 //Para a primeira linha da grid vir selecionada
 intIndexp := 1;//William Moreira da Silva - SOL 270069 PPM 1330205
 end;

{ Objetivo :  Retornar o ano da data atual ( ano corrente )
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.GetAnoAtual: Integer;
var
   wdia,
   wMes,
   wAno : Word;
begin
  DecodeDate(Date,wAno,wMes,wdia);
  Result := wAno;
end;

{Objetivo : Retornar a quantidade de meses ( Períodos ) para geração do arquivo
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.GetQuantidadePeriodos(dtInicial,dtFinal: TDate): Integer;
var
   dtInc : TDate;
   wDiaIni,wMesIni,wAnoIni : Word;
   wDiaFim,wMesFim,wAnoFim : Word;
   bMesmaData : Boolean;
   dtCompara  : TDate;
   intResult  : Integer;
begin

  intResult := 0;
  dtCompara := dtInicial;

  DecodeDate(dtCompara,wAnoIni,wMesIni,wDiaIni);
  DecodeDate(dtFinal,wAnoFim,wMesFim,wDiaFim);

  bMesmaData := ((wMesIni = wMesFim) and (wAnoIni = wAnoFim));
  {se for a mesma data incrementa 1, que será o retorno }
  if bMesmaData then
    begin
      {Array com as datas}
      SetLength(arMesAno,1);
      arMesAno[0] := DateToStr(dtCompara);
      Inc(intResult);
   end else
  begin
    while not bMesmaData do
      begin
        {decodifica a data de comparação }
        DecodeDate(dtCompara,wAnoIni,wMesIni,wDiaIni);
        {verifica se a data é a mesma, se for sai do looping, se não começa de novo ... }
        bMesmaData := ((wMesIni = wMesFim) and (wAnoIni = wAnoFim));

        {Array com as datas, o dia não importa, somente para pegar o mês/Ano}
        SetLength(arMesAno,intResult + 1);
        arMesAno[intResult] := DateToStr(dtCompara);

        {incrementa 1 mês na data de comparação }
        dtCompara := IncMonth(dtCompara,1);

        {incrementa o retorno }
        Inc(intResult);
      end;
  end;
  Result := intResult;
end;


{ Objetivo :  Retornar o dia do mês selecionado, de acordo com o parâmetro tipoData ( Inicio ou Fim )
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.GetData(comboMes : TComboBox; intAno : Integer; tipoData: TData ): String;
var
   sPeriodo : string;
   sUltDia  : string;
begin
  sPeriodo := GetPeriodos(comboMes,intAno);
  Case tipoData of
    dInicio : Result := '01/'+ Copy(sPeriodo,Pos('/',sPeriodo) + 1,2) +'/'+ Copy(sPeriodo,1,4);
    dFim    :
       begin
          Case comboMes.ItemIndex of
             1: sUltDia := iif(IsBissexto(intAno),29,28)//Fevereiro é 1, pois o índice começa com "0"
            else
                sUltDia := IntToStr(DiaMes[comboMes.ItemIndex]);//Default
          end;
          Result := sUltDia + '/' + Copy(sPeriodo,Pos('/',sPeriodo) + 1,2) +'/'+ Copy(sPeriodo,1,4);
       end;
  end;
end;

{ Objetivo :  Retornar o inteiro do mes selecionado
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.GetIndMes(indMes: TIndexMes): Integer;
begin
  Case indMes of
      Janeiro   : Result := 0;
      Fevereiro : Result := 1;
      Marco     : Result := 2;
      Abril     : Result := 3;
      Maio      : Result := 4;
      Junho     : Result := 5;
      Julho     : Result := 6;
      Agosto    : Result := 7;
      Setembro  : Result := 8;
      Outubro   : Result := 9;
      Novembro  : Result := 10;
      Dezembro  : Result := 11;
  end;
end;

{ Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.iif(bCondicao: Boolean; vSeVerdadeiro,
  vSeFalse: Variant): Variant;
begin
  if bCondicao then
    Result := vSeVerdadeiro
  else
    Result := vSeFalse;
end;

{ Objetivo :  validar os períodos selecionados
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.ValidaPeriodos: Boolean;
var
   sMensagem : string;
   bResult   : Boolean;
begin
  bResult   := False;
  sMensagem := '';

  if ((seAnoInicio.Value > seAnoFim.Value) or ((seAnoInicio.Value = seAnoFim.Value) and (CbMesInicio.ItemIndex > CbMesFim.ItemIndex)))then
      sMensagem      := 'O mês/ano final deve ser maior que o mês/ano inicial.';

  bResult := Length(Trim(sMensagem)) = 0;

  if not bResult then
   begin
     MsgDlg(sMensagem, 'Erro', mtError, [mbOK], 0);
     CbMesInicio.SetFocus;
   end;

  Result := bResult;
end;

{ Objetivo :  Retornar o mes selecionado para passar o parâmetro no select
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.GetPeriodos(ComboMes: TComboBox;
  intAno: Integer): String;
var
  iMes : Integer;
  sMes : string;
begin
  iMes := ComboMes.ItemIndex;
  Inc(iMes);
  sMes := FormatarTexto(IntToStr(iMes),2,false,'0');
  Result := IntToStr(intAno) + '/'+ sMes;
end;

{ Objetivo :  Selecionar o tipo de arquivo que será gerado, caso seja selecionado
              Contribuição será carregada a lista com as contribuições           }
procedure TFrmRelRecContrib.SetTipoDeArquivo(tipoArquivo: TArquivo);
begin
  case tipoArquivo of
    aResgate      :
    begin
      rgTipo.ItemIndex      := 0;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
    end;
    aContribuicao :
    begin
      rgTipo.ItemIndex := 1;
      ApagaItensGrid(SGPrincipal);
      CarregaGrid(SGPrincipal,gPrincipal,True);
    end;
  end;
  PSelecaoContribuicoes.Visible := rgTipo.ItemIndex = 1;
  FTipoDeArquivo                := tipoArquivo;
end;

procedure TFrmRelRecContrib.rgTipoClick(Sender: TObject);
var
   sTipoArquivo : string;
begin
  inherited;
  tipoArquivo := TArquivo(rgTipo.ItemIndex);
  SetTipoDeArquivo(tipoArquivo);
end;

{ Objetivo :  Retornar o tipo de arquivo selecionado
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.GetTipoDeArquivo: TArquivo;
begin
  Result := FTipoDeArquivo;
end;

{ Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.SGPrincipalDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   intTop : Integer;
   FontColor : TColor;
begin
  inherited;
  with SGPrincipal.Canvas do
    begin
      if ARow = 0 then { Índice do Título do StringGrid }
      begin
        Brush.Color := clBtnFace; { Cor de fundo }
        Font.Color  := clBlack;   { Cor da Fonte }
        Pen.Color   := Brush.Color;
        Rectangle(Rect);          { Impõe o Rect tampando o desenho do Reg. original }

        Font.Name   := 'MS Sans Serif';
        Font.Size   := 8;
        Font.Style  := [FSBold];
        DesenhaTexto(SGPrincipal.Canvas, Rect.Left + 3, Rect.Top + 5, 'Contribuições Possíveis'); { Desenha o texto sobre o Rect }
      end else
      begin
          if (gdSelected in State) and (Trim(SGPrincipal.Cells[ACol, ARow]) <> '') then
            begin
              FontColor   := clWhite;
              Brush.Color := clBlue;
            end else
            begin
              FontColor   := clBlack;
              Brush.Color := clWhite;
            end;

           Pen.Color   := Brush.Color;
           Rectangle(Rect);
           Brush.Style := bsClear;
           //pen.color   := clwhite;

           intTop := Rect.Top;

           //Font.Color  := clWhite;
           Font.Name   := 'MS Sans Serif';
           Font.Size   := 8;
           Font.Style  := [FSBold];
           Font.Color  := FontColor;

           DesenhaTexto(SGPrincipal.Canvas, Rect.Left + 3, intTop + 5, LerStrings(SGPrincipal.Rows[ARow].Text,1), 'E',340);
       end;
    end;
end;

{objetivo : Carregar grid indicada no parâmetro com os dados, pode ser principal ou selecionada
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.CarregaGrid(sgGrid: TStringGrid;
  tipoGrid: TGrid; bPrimeiraVez : Boolean = False);
var
   iCount : Integer;
   iAux   : Integer;
   sLinha : string;
begin
  case tipoGrid of
    gPrincipal :
    begin
       iCount := 0;
       { Se for a primeira vez, verifica os parâmetros para carregar de acordo com a ultima parametrização }
       if bPrimeiraVez then
         begin
           { O usuário pode alterar o tipo de Arquivo após a abertura do formulário, se mudar tem que carregar novamente }
           if Assigned(slPrinc) then FreeAndNil(slPrinc);
           if Assigned(slSec)   then FreeAndNil(slSec);

           { Carrega os itens, separando o que é parametrizado do que não é }
           sqlSelecao.Open;
           sgGrid.FixedColor := clBtnFace;
           While not cdsSelecao.Eof do
           begin
             sLinha := '"'+IntToStr(cdsSelecao.FieldByName('IDCONTRIBUICAO').AsInteger)+'","' +
                                    cdsSelecao.FieldByName('NOME').AsString            +'","' +
                                    cdsSelecao.FieldByName('FLGARQDIGCONT').AsString   +'"';
              if cdsSelecao['FLGARQDIGCONT'] <> '1' then { 0 ou ''}
                begin
                   if Not Assigned(slPrinc) then slPrinc := TStringList.Create;//Só posso destruir quando destruir este formulário, é usado na troca de ítens
                   slPrinc.Add(sLinha)
                end else
                begin
                   if Not Assigned(slSec) then slSec := TStringList.Create;//Só posso destruir quando destruir este formulário, é usado na troca de ítens
                   slSec.Add(sLinha);
                end;
             cdsSelecao.Next;
           end;
           ApagaItensGrid(SGPrincipal);               //Se já tiver aberto o formulário, tem que excluir o que foi carregado na abertura
           if Assigned(slPrinc) then
             transferirDadosGrid(slPrinc,SGPrincipal);//Carrega os campos que não estão parametrizados
           controlaBotao(btIncluir,SGPrincipal);      //Habilita botão para incluir na lista de parametrizações
           ApagaItensGrid(sgSecundaria);              //Se o formulário já foi aberto uma vez, tem que excluir o que foi carregado na abertura e carregar novamente
           if Assigned(slSec) then
             transferirDadosGrid(slSec,sgSecundaria); //Carrega os campos parametrizados

           controlaBotao(btRetirar,sgSecundaria);     //Habilita botão para tirar da lista de parametrizações
           controlaBotao(bbtnConfirmar,sgSecundaria); //Habilita o botão confirmar
           controlaBotao(bbtnCancelar,sgSecundaria)
         end else
         begin
            //William Moreira da Silva - SOL 270069 PPM 1330205
            //Se a variavel estiver zerada, é pq não foi selecionada nenhuma linha, ou seja selecionar a primeira linha.
            if(intIndexS = 0) then
            begin
                intIndexS := 1;
            end;
            //William Moreira da Silva - SOL 270069 PPM 1330205
            
            sLinha := TrimRight(sgSecundaria.Rows[intIndexS].Text);

            { Ativa a cópia sem o item selecionado para incluir na sgSecundaria }
            slClone := TStringList.Create;
            For iCount := 0 to slSec.Count -1 do
              if slSec[iCount] <> sLinha then
                slClone.Add(slSec[iCount]);

            { Apaga a slSec para ser atualizada }
            slSec.Clear;
            For iCount := 0 to slClone.Count -1 do
              slSec.Add(slClone[iCount]);

           { Apaga e atualiza a sgSecundaria }
           ApagaItensGrid(sgSecundaria);
           transferirDadosGrid(slSec,sgSecundaria);

           controlaBotao(btRetirar,sgSecundaria);//Habilita botão para tirar da lista de parametrizações
           controlaBotao(bbtnConfirmar,sgSecundaria);
           controlaBotao(bbtnCancelar,sgSecundaria);


           slPrinc.Add(sLinha);                  //Inclui na StringList

           { Ordena a StringList para incluir no StringGrid }
           slPrinc.Sorted := False;
           slPrinc.Sorted := True;

           ApagaItensGrid(SGPrincipal);             //Apaga A StringGridPrincipal
           transferirDadosGrid(slPrinc,SGPrincipal);//Adiciona os itens na StringGridPrincipal
            controlaBotao(btIncluir,SGPrincipal);   //Se tiver lista não parametrizada, carrega o indice da lista no 1º cara (2º, o 1º é o Título e habilita o botão para excluir da lista )

         end;
    end;
    gSecundaria:
    begin
       sLinha :=  TrimRight(SGPrincipal.Rows[intIndexP].Text);
       { Adiciona Linha selecionada na StringList }
       if not Assigned(slSec) then
         slSec := TStringList.Create;
       slSec.Add(sLinha);

       { Habilita a ordenação do StringGrid }
       slSec.Sorted := False;
       slSec.Sorted := True;


       ApagaItensGrid(sgSecundaria);             //Apaga todos os itens do StringGrid
       transferirDadosGrid(slSec,sgSecundaria);  //Passa os dados da slSec para a SgSecundaria
       controlaBotao(btRetirar,sgSecundaria);    //Se tiver lista não parametrizada, carrega o indice da lista no 1º cara (2º, o 1º é o Título e habilita o botão para excluir da lista )
       controlaBotao(bbtnConfirmar,sgSecundaria);
       controlaBotao(bbtnCancelar,sgSecundaria);

       copiaLista(slPrinc,sLinha);               //Copia a StringList para o clone, ignorando somente a linha selecionada

       { Apaga a slPrinc ( StringGrid Principal ) para incluir o clone nele }
       slPrinc.Clear;
       For iCount := 0 to slClone.Count -1 do
         slPrinc.Add(slClone[iCount]);

       { Apaga a StringGridPrincipal para inclui novamente o slPrinc nele }
       ApagaItensGrid(SGPrincipal);

       transferirDadosGrid(slPrinc,SGPrincipal);

       { Se tiver lista não parametrizada, carrega o indice da lista no 1º cara (2º, o 1º é o Título e habilita o botão para excluir da lista ) }
       controlaBotao(btIncluir,SGPrincipal);

      if Assigned(slClone) then
        FreeAndNil(slClone);
    end;
  end;
end;

{Objetivo : Apagar os itens da StringGrid passada como parâmetro
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.ApagaItensGrid(sgGrid: TStringGrid);
var
   iCount : Integer;
begin
  for iCount := 1 to sgGrid.RowCount -1 do
   sgGrid.Rows[iCount].Clear;
end;

{ Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.btIncluirClick(Sender: TObject);
var
   indexCopia : Integer;
   procedure RetemIndiceDaContribuicaoSelecionada(indContrib: Integer);
   begin
     indexCopia := indContrib;
   end;
begin
  inherited;

  RetemIndiceDaContribuicaoSelecionada(intIndexP);
  CarregaGrid(sgSecundaria,gSecundaria);
  posicionaItemNaLista(IndexCopia,SGPrincipal);
end;

procedure TFrmRelRecContrib.SGPrincipalSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  { Item Selecionado -  Robson.Andrade - SOL242573 / 16949 PPM 979572 }
  intIndexp := ARow;
end;

{ Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(slSecundaria);
  FreeAndNil(slSec);
  FreeAndNil(slPrinc);
end;

{ Objetivo: Procurar a linha em uma StringGrid
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.Procura(sLinha: String;
sGrid: TStringGrid): Boolean;
var
  iCount  : Integer;
  bResult : Boolean;
begin
  bResult := False;
  for iCount := 0 to sGrid.RowCount - 1 do
  begin
    if (TrimRight(sGrid.Rows[iCount].Text) = sLinha) then
      begin
         bResult := True;
         Break;
      end;
  end;
  Result := bResult;
end;

{ Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.posicionaItemNaLista(intIndex: Integer;
  sgGrid: TStringGrid);
begin
  //William Moreira da Silva - SOL 270069 PPM 1330205
  //Reposicionando o Registro
  //  if intIndex = 1 then
  //     intIndex := 1
  //   else
  //     intIndex := intIndex - 1;
  //William Moreira da Silva - SOL 270069 PPM 1330205
  SGGrid.row := intIndex;
end;


{ Objetivo : Desenhar os itens na StringGrid
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.sgSecundariaDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   intTop : Integer;
   FontColor : TColor;
begin
  inherited;
  with sgSecundaria.Canvas do
    begin
      if ARow = 0 then { Desenha o título da StringGrid }
      begin
        Brush.Color := clBtnFace;
        Font.Color  := clBlack;
        Pen.Color   := Brush.Color;
        Rectangle(Rect);


        Font.Name   := 'MS Sans Serif';
        Font.Size   := 8;
        Font.Style  := [FSBold];
        DesenhaTexto(SGSecundaria.Canvas, Rect.Left + 3, Rect.Top + 5, 'Contribuições Selecionadas');
      end else
      begin
          if (gdSelected in State) and (Trim(SGSecundaria.Cells[ACol, ARow]) <> '') then
            begin
              FontColor   := clWhite;
              Brush.Color := clBlue;
            end else
            begin
              FontColor   := clBlack;
              Brush.Color := clWhite;
            end;

           Pen.Color   := Brush.Color;
           Rectangle(Rect);
           Brush.Style := bsClear;

           intTop := Rect.Top;

           Font.Name   := 'MS Sans Serif';
           Font.Size   := 8;
           Font.Style  := [FSBold];
           Font.Color  := FontColor;

           DesenhaTexto(SGSecundaria.Canvas, Rect.Left + 3, intTop + 5, LerStrings(SGSecundaria.Rows[ARow].Text,1), 'E',intSgDefColWiWidth);
       end;
    end;
end;

{ Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.btRetirarClick(Sender: TObject);
begin
  inherited;
  CarregaGrid(SGPrincipal,gPrincipal);
end;

procedure TFrmRelRecContrib.sgSecundariaSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  {Item da StringGrid }
  intIndexS := ARow;
end;

{ Objetivo : Remover item em Branco da StringGrid Secundária
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.RemoveRegistroEmBrancoDaSecundaria;
var
   slTemp : TStringList;
   iCount : Integer;
begin
  slTemp := nil;
  Try
    //O primeiro item (0) é o título da StringGrid
    For iCount := 1 to sgSecundaria.RowCount -1 do
      if Length(Trim(sgSecundaria.Rows[iCount].Text)) > 0 then
        begin
           if not Assigned(slTemp) then
             slTemp := TStringList.Create;
            slTemp.Add(sgSecundaria.Rows[iCount].Text);
        end;

     //Faz a cópia sem o Registro em branco
     if Assigned(slTemp) then
       begin
         //Apaga os Registros da Secundária
         ApagaItensGrid(sgSecundaria);
         For iCount := 0 To slTemp.Count -1 do
           begin
             //Na posição 0 está o titulo
             sgSecundaria.RowCount := iCount+2;
             sgSecundaria.Rows[iCount + 1].Add(slTemp[iCount]);
           end;
       end;
  finally
    if Assigned(SlTemp) then
      FreeAndNil(slTemp)
    else
      btRetirar.Enabled := False;//Se não criou a lista é porque não há nada selecionado.
  end;
end;

procedure TFrmRelRecContrib.btConfirmarClick(Sender: TObject);
var
  sIdContribuicao : string;
  slContribuicao  : TStringList;
  iCount          : Integer;
  iIdContribuicao : Integer;
begin
  inherited;
  try
    For iCount := 0 to sgSecundaria.RowCount -1 do
      begin
        {Guarda o idContribuicao no StringList}
        if ((iCount > 0) and (Length(Trim(sgSecundaria.Rows[iCount].Text)) > 0)) then {Não pode ler no índice "0", pois nele está o título}
          begin
            {Pega o id da Contribuição}
            sIdContribuicao := LerStrings(sgSecundaria.Rows[iCount].Text,0);
            if not Assigned(slContribuicao) then
              slContribuicao := TStringList.Create;

            {Recebe o idContribuição no StringList}
            slContribuicao.Add(sIdContribuicao);
          end;
      end;
    {Zera os parâmetros da tabela CONTRIBUICAO, sem os parâmetros passa valor default ( 0 para todos os campos ) }
    AtualizaParametro;
    {Inicia o Update na tabela CONTRIBUICAO }
    if Assigned(slContribuicao) then
      For iCount := 0 to slContribuicao.Count -1 do
        begin
          iIdContribuicao := StrToInt(slContribuicao[iCount]);
          AtualizaParametro(iIdContribuicao,pIdContrib);
        end;

  finally
    if Assigned(slContribuicao) then
      FreeAndNil(slContribuicao);

  end;
end;

{ Objetivo : Atualizar o item parametrizado
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.AtualizaParametro(iPar: Integer = 0; tParametro: TPar = pDefault);
var
   sSQL : string;
   objQry : TwwQuery;
begin
  inherited;
  Case tParametro of
     pDefault   : sSQL := 'UPDATE CONTRIBUICAO SET FLGARQDIGCONT = 0';
     pIdContrib : sSQL := 'UPDATE CONTRIBUICAO SET FLGARQDIGCONT = 1 WHERE IDCONTRIBUICAO = ' + IntToStr(iPar);
  end;

  Try
    objQry := TwwQuery.Create(Nil);
     With objQry do
       begin
         DatabaseName := 'BaseDados';
         SQL.Add(sSQL);
         ExecSQL;
       end;
  Finally
    if Assigned(objQry) then
      FreeAndNil(objQry);
  end;
end;

{ Objetivo : Habilitar e desabilitar botões passados como parâmetro se Tiver itens no StringGrid
 Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.controlaBotao(bt: TBitBtn; sGrid: TStringGrid);
var
   bPrincipal : Boolean;
begin

  if sGrid.RowCount > 1 then
    begin
      if Length(Trim(sGrid.Rows[1].Text)) > 0 then
        bt.Enabled := True
      else
        bt.Enabled := False;
    end else
    bt.Enabled := False;
end;

{ Objetivo : Transferir Items selecionados da StringList para StringGrid
  Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.transferirDadosGrid(slSaida: TStringList;
  sgRecebe: TStringGrid);
var
   iCount : Integer;
begin
   For iCount := 0 to slSaida.Count -1 do
    begin
        SGRecebe.RowCount := iCount + 2;
        SGRecebe.Rows[iCount + 1].Add(slSaida[iCount]);
     end;
end;

{ Objetivo : Copiar a StringList que é montada na seleção ou exclusão dos itens da contribuição
  Robson.Andrade - SOL242573 / 16949 PPM 979572 }
procedure TFrmRelRecContrib.copiaLista(slLista: TStringList;
  sLinha: String);
var
   iCount : Integer;
begin
   For iCount := 0 to slLista.Count -1 do
     begin
       if slLista[iCount] <> sLinha then
         begin
           if Not Assigned(slClone) then
              slClone := TStringList.Create;
           slClone.Add(slLista[iCount]);
         end;
     end;
 end;


{ Objetivo : Retornar o "In" do Select da Contribuição
  Robson.Andrade - SOL242573 / 16949 PPM 979572 }
function TFrmRelRecContrib.GetIn: String;
var
  sResult : string;
  iCount  : Integer;
begin
  sResult := '';
  if Assigned(slSec) then
     For iCount := 0 to slSec.Count -1 do
        if iCount = 0 then
          sResult := QuotedStr(LerStrings(slSec[iCount],0)) + ','
        else
          sResult := sResult + QuotedStr(LerStrings(slSec[iCount],0))+',';

  if Length(Trim(sResult)) > 0 then
    if Copy(sResult,Length(sResult),1) = ',' then
      sResult := Copy(sResult,1,Length(sResult) - 1);

  Result := sResult;
end;


function TFrmRelRecContrib.LerMes(arrMes: array of String;
  intMes: Integer): String;
begin
  Result := arrMes[intMes];
end;

procedure TFrmRelRecContrib.FormShow(Sender: TObject);
begin
  inherited;
  intSgSecWidthDef   := sgSecundaria.Width;
  intSgDefColWiWidth := intSgSecWidthDef - 20;
end;

procedure TFrmRelRecContrib.FormResize(Sender: TObject);
begin
  inherited;
  if intSgSecWidthDef <> sgSecundaria.Width then
    begin
      intSgSecWidthDef   := sgSecundaria.Width;
      intSgDefColWiWidth := intSgSecWidthDef - 30;
      sgSecundaria.DefaultColWidth := intSgDefColWiWidth;
    end;
end;

end.

