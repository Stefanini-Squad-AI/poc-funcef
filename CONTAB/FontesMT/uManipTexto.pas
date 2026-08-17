unit uManipTexto;

interface

uses Dialogs, SysUtils, printers, graphics, forms, dbtables, wintypes, lzExpand,
     DbiProcs, DbiTypes,db, WinProcs, Classes, uSistema,uCMFileUtils;


Procedure Msg(s:string;T:String);
Procedure ChamaForm(C:TFormClass;F:TForm);
Procedure AtualizaDoc(sStatus,sEmisBloq,sNossoNumero:String;
          dData:TDateTime;
          fControleRemessa,fCodDocumento:Real);
Procedure VisualizaArquivo(NomedoArquivo: String);
Function  AlinhaDir(S:string; T:Integer):String;
Function  AlinhaEsq(S:string; T:Integer):String;
Function  ZD(N:string; T:Integer):String;
Function  ZE(N:string; T:Integer):String;
Function  Spc (QTD:Integer):String;
Function  RemoveBarras(Data: String): String;
function  DevolveBarras(Data: String):TDateTime;
function  RemoveVirgulas(Valor: Real;Decimais: Integer):String;
function  DevolveVirgulas(Valor: String;Decimais: Integer):Real;
function  MascaraAlfa(S:string): String;
Function  Modulo(Carteira,Divisor,base,Tam:Integer;NossoNumero: String): String;
Function  RetiraEspacos(S:String): String;

Var
bArquivoCriado,GeraNossoNumero: Boolean;
UltNossoNumero,UltCodArquivoGerado,NomeEmpresa,NumeEmpresaBanco,NossoNumero,
DiasProtesto,ValorJuros,CodArquivoRemessa, SNomeArquivo,
sNossoNumero: String;
QryTexto, QryAtualiza, QryEmpresa: TQuery;
ArquivoTexto, ArquivoLog: TextFile;

implementation

function DevolveBarras(Data: String):TDateTime;
Begin
    {Em Cima de Uma Data no formato ddmmyy ou ddmmyyyy separa os caracteres e adciona as barras}
    If Length(Data)=6 Then
       Result := StrToDate(Copy(Data,1,2) + '/' + Copy(Data,3,2) + '/' + Copy(Data,5,2))
    Else
       Result := StrToDate(Copy(Data,1,2) + '/' + Copy(Data,3,2) + '/' + Copy(Data,5,4));
end;

function DevolveVirgulas(Valor: String;Decimais: Integer):Real;
Var iExp10, X: Integer;
Begin
    iExp10 := 1;
    For X:=1 To Decimais Do
    Begin
       iExp10 := iExp10 * 10;
    End;

    {Em Cima de um valor numerico Decimal, adiciona os centavos separados por vírgula}
    Result := (StrToFloat(Valor)/iExp10);
end;

function RemoveVirgulas(Valor: Real;Decimais: Integer):String;
Var iPosiVirgula, X: Integer;
    sValor: String;
Begin
   sValor := FloatToStr(Valor);
   If Valor = 0 Then
      Result := '0'
   Else
   Begin
    iPosiVirgula := Pos(',',sValor);
    If iPosiVirgula = 0 Then
    Begin
      For X:=1 To Decimais Do sValor := sValor + '0';
      Result := sValor;
    End
    Else
    Begin
       If (Length(svalor)-iPosiVirgula) < Decimais Then
           For X:=1 To Decimais - (Length(svalor)-iPosiVirgula) Do sValor := sValor + '0';
       Result := Copy(sValor,1,iPosiVirgula-1) + Copy(sValor,iPosiVirgula+1,Decimais);
    End;
   End;
end;


Function RemoveBarras(Data: String): String;
Var Dia, Mes, Ano: Word;
    SDia, SMes, SAno: String;
    aData: TDateTime;
Begin
    {Retorna a data no formato ddmmyy sem as barras, independente do formato de entrada}
    If Trim(Data) = '' Then
       Result := '000000'
    Else
    Begin
        aData := StrToDate(Data);
        DecodeDate(aData,Ano,Mes,Dia);
        SDia := IntToStr(Dia);
        SMes := IntToStr(Mes);
        SAno := IntToStr(Ano);
        If Length(SDia) = 1 Then SDia := '0' + SDia;
        If Length(SMes) = 1 Then SMes := '0' + SMes;
        If Length(SAno) > 2 Then SAno := Copy(Sano,Length(Sano)-1,2);
        Result := Sdia+Smes+Sano;
    End;
end;

Procedure Msg(s:string;T:String);
begin
   Application.MessageBox(PChar(s),PChar(T),mb_IconInformation);
end;

Function AlinhaDir(S:string; T:Integer):String;
var temp:string;
    cont:Integer;
Begin
     If S <> '' Then
     Begin
          temp := MascaraAlfa(s);

          If length(Temp) > T Then
             temp := Copy(Temp,1,T);

          for cont:=1 to t - length(s) do
             temp:=' '+temp;

          result := temp;
     End
     Else
          result := Spc(T);
end;

Function AlinhaEsq(S:string; T:Integer):String;
var temp:string;
    cont:Integer;
Begin
   If S <> '' Then
   Begin

     temp := MascaraAlfa(s);

     If length(Temp) > T Then
          temp := Copy(Temp,1,T);

     for cont:=1 to t - length(s) do
     temp:=temp+' ';
     result := temp;
   End
     Else
          result := Spc(T);
end;

Function ZD(N:string; T:Integer):String;
var temp:string;
    cont, Tam:Integer;
Begin
     temp := Trim(MascaraAlfa(N));

     temp := RetiraEspacos(temp);

     Tam := length(temp);

     for cont:=1 to t - Tam do
         temp:='0'+temp;
     result := temp;
end;

Function ZE(N:string; T:Integer):String;
var temp:string;
    cont, Tam:Integer;
Begin
     temp := Trim(MascaraAlfa(N));

     temp := RetiraEspacos(temp);

     Tam := length(temp);

     for cont:=1 to t - Tam do
     temp:=temp+'0';
     result := temp;
end;

Function Spc (QTD:Integer):String;
var cont: Integer;
    t:string;
begin
   t:='';
   for cont:=1 to qtd do
   t:=t+' ';
   result := t;
end;

function  MascaraAlfa(S:string): String;
Var sAuxiliar: String;
    x, iTam: Integer;
Begin
  sAuxiliar := S;
  iTam := Length(S);
  For X:=0 to iTam Do
  Begin
       Case SAuxiliar[x] of
       'Á','À','Ã','Ä','Â','á','à','ã','ä','â': SAuxiliar[x] := 'A';
       'Ô','Ó','Ò','Õ','Ö','ô','ó','ò','õ','ö': SAuxiliar[x] := 'O';
       'Ê','É','È','Ë','ê','é','è','ë': SAuxiliar[x] := 'E';
       'Î','Í','Ì','Ï','î','í','ì','ï': SAuxiliar[x] := 'I';
       'Û','Ü','Ú','Ù','û','ü','ú','ù': SAuxiliar[x] := 'U';
       'Ç','ç': SAuxiliar[x] := 'C';
       'Ñ','ñ': SAuxiliar[x] := 'N';
       '`','''','@','-','_','+','*','|','\','/','$','%','&': SAuxiliar[x] := ' ';
       ',': SAuxiliar[x] := '.';
       end;
  End;

  Result := UpperCase(sAuxiliar);
end;

Procedure VisualizaArquivo(NomedoArquivo: String);
Begin
  If Application.MessageBox(Pchar(NomedoArquivo + ' Foi Gerado Com Sucesso, Deseja visualizar o arquivo?'),'Cobrança Eletrônica',Mb_IconQuestion + Mb_YesNo) = Id_Yes Then
  Begin
//     CopyFile(Pchar(NomedoArquivo),PChar(ExtractFilePath(NomedoArquivo) + 'Visualiza.Txt'),False);
     ExecuteFile(ExtractFilePath(NomedoArquivo) + 'Visualiza.Txt','',true,false);
  End;
End;

Function Modulo(Carteira,Divisor,base,Tam:Integer;NossoNumero: String): String;
Var
   sNumero: String;
   iBase, x, iDividendo, iDigito: Integer;
Begin
     If Carteira = null Then
        sNumero := ZD(NossoNumero,Tam)
     Else
        sNumero := IntToStr(Carteira) + ZD(NossoNumero,Tam);

     iBase := 2;
     iDividendo := 0;

     For X:=1 to Length(sNumero) do
     begin
         iDividendo := iDividendo + (StrToInt(sNumero[x]) * ibase);
         if iBase = 2 Then
          iBase := base
         Else
          Dec(iBase);
     end;

     iDigito := Divisor - (iDividendo Mod Divisor);

     If iDigito = 10 Then
        Result := ZD(NossoNumero,Tam) + 'P'
     Else
        Result := ZD(NossoNumero,Tam) + IntToStr(iDigito);

end;

Procedure ChamaForm(C:TFormClass;F:TForm);
Begin
         Try
            Application.CreateForm(C,F);
            F.ShowModal;
         finally
            F.Free;
         End;
end;

Procedure AtualizaDoc(sStatus,sEmisBloq,sNossoNumero:String;
          dData:TDateTime; fControleRemessa,fCodDocumento:Real);
Begin
 With QryAtualiza do
 Begin
   Close;
   Prepare;
   Params[0].AsString := sStatus;
   Params[1].AsString := sEmisBloq;
   Params[2].AsString := sNossoNumero;
   Params[3].AsFloat := fControleRemessa;
   Params[4].AsDate := dData;
   Params[5].AsFloat := fCodDocumento;
   Unprepare;
   ExecSql;
 End;
end;

Function RetiraEspacos(S:String): String;
Var sAuxiliar: String;
    iPosEspacos, iTam, x : Integer;
    sAtual: Char;
Begin
  //Retira Espaços em branco da string
  Result := S;

  sAuxiliar := Trim(S);

  iPosEspacos := Pos(' ',sAuxiliar);

  While  iPosEspacos <> 0 Do
  Begin
        iTam := Length(sAuxiliar);

        for x:= iposEspacos to iTam - 1 do
        Begin
          sAtual := sAuxiliar[x];
          sAuxiliar[x] := sAuxiliar[x+1];
          sAuxiliar[x+1] := sAtual;
        End;

        sAuxiliar := Trim(sAuxiliar);
        iPosEspacos := Pos(' ',sAuxiliar);
  End;

  Result := Trim(sAuxiliar);


End;


end.
