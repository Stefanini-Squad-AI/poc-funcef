unit UGeral;

interface


uses Registry, SysUtils, Classes, WinTypes, Forms, Dialogs,Qrctrls,Windows,stdctrls,
     extctrls,wwDBLook,Spin ,Wwquery,checklst,DB,Math ;


procedure limpaTexto(var  pai : TPanel );
procedure Quebra(Param1 : Double; var Param2, Param3 : String);
function  Junta(Param1, Param2 : String) : TDateTime;
function  trazmes(mes : string):string;
function ConverteFloat(sConverter : string):double;
procedure Retornaindice(var objeto : tComboBox ; var objeto2 : TSpinEdit ) ;
function  VoltaFlgInterno(idpessjur,idplanoprev,idpessoa : String ;qrysit : Twwquery ):String;
Function RetornaDiaCob(Dia : integer ; MesCorrente,AnoMes : String ):String;
Procedure pegaid(chklst : TCheckListBox;chave,nome,TabelaPai : string ; var qryaux : TwwQuery );
Procedure TiraDuplicata( var chklstFilho : TCheckListBox );
Function PegaidCheck(chklst : TCheckListBox;chave,nome : string ; var qryaux : TwwQuery ):String;
Function VoltaProxMes(sMes : String):String;//incrementa data no formato aaaa/mm
Procedure VoltaSistemasInstaladodos(qry : twwquery);
function VoltaDividaAtrasoAssist(QryAssist : TwwQuery ; IdTitular,IdDependente,Data : String ; DividaAtraso : Char) :Integer;
function DataUltEvento(sidpessjur,sidtitular,siddependente,sidplanass,sidplanoprev : String) : String;
function DiasAtraso(sidpessjur,sidtitular,siddependente,sidplanass,sidplanoprev : String) : Integer;
function MensAtraso(sidpessjur,sidtitular,siddependente,sidplanass,sidplanoprev : String) : Integer;
function TruncaRound(f:String;n:integer):string;
function ArredondaValor(Valor : String) : Extended;

var
   itodos : boolean;
   Assistencial,
   Previdenciario,
   Folha,
   Emprestimo : boolean;
implementation


Procedure VoltaSistemasInstaladodos(qry : twwquery);
begin
   //consulta de sistemas instalados
   qry.close;
   qry.sql.clear;
   qry.sql.add(' SELECT * FROM MODULO ');
   qry.open;

   //VERIFICA ASSISTENCIAL
   if qry.locate('idmodulo',17,[loCaseInsensitive]) then Assistencial := True else Assistencial := False;

   //VERIFICA EMPRESTIMO
   if qry.locate('idmodulo',15,[loCaseInsensitive]) then Emprestimo := True else Emprestimo := False;

   //VERIFICA FOLHA
   if qry.locate('idmodulo',18,[locaseinsensitive]) then Folha := True else Folha := False;

   //VERIFICA PREVIDENCIARIO
   if qry.locate('idmodulo',16,[locaseinsensitive]) then Previdenciario := True else Previdenciario := False;
end;


Function VoltaProxMes(sMes : String):String;//incrementa data no formato aaaa/mm
var sMesCob,sMesProx,sAno : String;
begin
     sMesCob := sMes;
     if sMesProx = '12' then
     begin
        sMesProx := '01';
        sAno := inttostr(strtoint(Copy(sMesCob,1,4)) + 1);
        sMesCob[1] := sAno[1];
        sMesCob[2] := sAno[2];
        sMesCob[3] := sAno[3];
        sMesCob[4] := sAno[4];
     end
     else
     begin
        sMesProx := inttostr(StrToInt(Copy(sMesCob,6,2)) + 1) ;
     end;

     if Length(sMesProx) < 2 then  sMesProx :=  '0'+sMesProx;

     sMesCob[6] := sMesProx[1];
     sMesCob[7] := sMesProx[2];

     Result := sMesCob;
end;

Function PegaidCheck(chklst : TCheckListBox;chave,nome: string ; var qryaux : TwwQuery ):String;
var marcado,i : integer;
   Volta : String;
begin
   marcado := 0;

   for i := 0 to chklst.Items.Count - 1 do
   begin
         if not chklst.checked[i] then
         continue
         else inc(marcado);
   end;

   Volta := '';
   if marcado = 0 then
   begin
      Result := '';
      Exit;
   end;

   for i := 0 to chklst.Items.Count - 1 do
   begin
      if (not chklst.checked[i]) and ( marcado <> 0) then continue;
      if not  qryaux.Locate(''+Nome+'',chklst.items[i],[]) then
      begin
         continue;
      end
      else
      begin
         Volta := qryaux.fieldbyname(''+chave+'').AsString + ',';
      end;
   end;

   Volta := Copy(Volta,Length(Volta) - 1 ,1);
   Result := Volta;

end;

Procedure pegaid(chklst : TCheckListBox;chave,nome,TabelaPai : string ; var qryaux : TwwQuery );
var
   marcado, i : integer;
   Volta : String;
begin
   marcado := 0;

   for i := 0 to chklst.Items.Count - 1 do
   begin
         if not chklst.checked[i] then
         continue
         else inc(marcado);
   end;

   Volta := '';
   if marcado = 0 then
   begin
      qryAux.Filter := '';
      Exit;
   end;

   for i := 0 to chklst.Items.Count - 1 do
   begin
      if (not chklst.checked[i]) and ( marcado <> 0) then continue;
      if not  qryaux.Locate(''+Nome+'',chklst.items[i],[]) then
      begin
         continue;
      end
      else
      begin
         Volta := qryaux.fieldbyname(''+chave+'').AsString + ',';
      end;
   end;

   Volta := Copy(Volta,Length(Volta) - 1 ,1);

   qryaux.close;
   qryAux.SQL.Add(' AND '+TabelaPai+'.'+Chave+' IN ('+Volta+')');
   qryaux.open;

end;

procedure TiraDuplicata( var chklstFilho : TCheckListBox );
var i,j : integer;
    Compara : String;
begin
   if (chklstFilho.Items.Count = 0)  then exit;

   //tira items iguais, se existirem
   for i := 0 to chklstFilho.Items.Count - 1 do              
   begin
      try
         if i >= chklstFilho.Items.Count - 1 then exit;
         Compara := chklstFilho.items[i];
         for j := 0 to chklstFilho.Items.Count - 1 do
         begin
            if i = j then continue;
            if chklstFilho.items[j] = chklstFilho.items[i] then chklstFilho.items.delete(j);
         end;
      except
         Continue;
      end;
   end;
end;

procedure Retornaindice(var objeto : tComboBox ; var objeto2 : TSpinEdit ) ;
var pmes : string;
    pano : integer;
begin

     pmes := copy(datetostr(date),4,2);
     pano := strtoint(copy(datetostr(date),7,4));

     if pmes = '01'    then objeto.itemindex := 0;
     if pmes = '02'    then objeto.itemindex := 1;
     if pmes = '03'    then objeto.itemindex := 2;
     if pmes = '04'    then objeto.itemindex := 3;
     if pmes = '05'    then objeto.itemindex := 4;
     if pmes = '06'    then objeto.itemindex := 5;
     if pmes = '07'    then objeto.itemindex := 6;        
     if pmes = '08'    then objeto.itemindex := 7;
     if pmes = '09'    then objeto.itemindex := 8;
     if pmes = '10'    then objeto.itemindex := 9;
     if pmes = '11'    then objeto.itemindex := 10;
     if pmes = '12'    then objeto.itemindex := 11;

     objeto2.value := pano;
end;

//Retorna o disa de cobrança das contribuições assistenciais
Function RetornaDiaCob(Dia : integer ; MesCorrente,AnoMes : String ):String;
var
 sDia , sAno , sData : String;
 iMes : Integer;
begin
   sDia := inttostr(Dia);
   sAno := copy(AnoMes,1,4);
   iMes := strtoint(copy(anomes,6,2));
   if mescorrente = 'P' then inc(iMes);
   sData := sDia+'/'+inttostr(imes)+'/'+sAno;
   result :=  sData;
end;

procedure Quebra(Param1 : Double; var Param2, Param3 : String);
begin
     Param2 := DateToStr(Int(Param1));
     Param3 := TimeToStr(Frac(Param1));
end;

function Junta(Param1, Param2 : String) : TDateTime;
var aux1, aux2 : TDateTime;
begin
     aux1 := StrToDate(Param1);
     aux2 := StrToTime(Param2);
     Result := aux1 + aux2;
end;

{ procedure que limpa o texto de todos os ( edit , combo e datedit) de um panel }
procedure limpaTexto(var  pai : TPanel );
var
   i : integer;
begin

for i:= 0 to pai.componentcount -1 do
begin
   if pai.components[i] is Tedit
   then Tedit(pai.components[i]).text := '';
   if pai.components[i] is TwwDBLookupCombo
   then  TwwDBlookupCombo(pai.components[i]).text := '' ;
end;

end;

function trazmes(mes : string):string;
var
   saida : string;
begin
   if uppercase(mes)='JANEIRO' then saida:='01';
   if uppercase(mes)='FEVEREIRO' then saida:='02';
   if uppercase(mes)='MARÇO' then saida:='03';
   if uppercase(mes)='ABRIL' then saida:='04';
   if uppercase(mes)='MAIO' then saida:='05';
   if uppercase(mes)='JUNHO' then saida:='06';
   if uppercase(mes)='JULHO' then saida:='07';
   if uppercase(mes)='AGOSTO' then saida:='08';
   if uppercase(mes)='SETEMBRO' then saida:='09';
   if uppercase(mes)='OUTUBRO' then saida:='10';
   if uppercase(mes)='NOVEMBRO' then saida:='11';
   if uppercase(mes)='DEZEMBRO' then saida:='12';
   trazmes := saida;
end;

function ConverteFloat(sConverter : string):double;
var iPosPonto, iPosVirg : integer;
    cAux : char;
    dConvertido : double;
begin

  if sConverter <> '' then
  begin

     cAux := DecimalSeparator;
     DecimalSeparator := '.';
     iPosPonto := pos('.',sConverter);

     while iPosPonto <> 0 do
     begin
       sConverter := copy(sConverter,1,iPosPonto-1)+','+copy(sConverter,iPosPonto+1,length(sConverter));
       iPosPonto := pos('.',sConverter);
     end;
     iPosVirg := pos(',',sConverter);

     if iPosVirg <> 0 then
       dConvertido := StrToFloat(copy(sConverter,1,iPosVirg-1)+'.'+copy(sConverter,iPosVirg+1,length(sConverter)))
     else
       dConvertido := StrToFloat(sConverter);

     DecimalSeparator := cAux;
  end
  else
  begin
     dConvertido := 0;
  end;

  Result := dConvertido
end;

//volta situação do participante na fundação //
function VoltaFlgInterno(idpessjur,idplanoprev,idpessoa : String ;qrysit : Twwquery ):String;
begin
   result := '';

   qrysit.close;
   qrysit.sql.clear;
   qrysit.SQL.add(' SELECT SITPART.FLGINTERNO '+
                  ' FROM SITPART , PARTPREVPLAN  '+
                  ' WHERE PARTPREVPLAN .IDPESSJUR = '+idpessjur+''+
                  ' AND PARTPREVPLAN.IDPLANOPREV = '+idplanoprev+''+
                  ' AND PARTPREVPLAN.IDPESSOA =  '+idpessoa+''+
                  ' AND PARTPREVPLAN.IDSITPART = SITPART.IDSITPART ');
   try
      qrysit.open;
   except end;

   result := qrysit.fieldbyname('flginterno').AsString;

end;

function VoltaDividaAtrasoAssist(QryAssist : TwwQuery ; IdTitular , IdDependente ,
Data{Data que será testada em caso de atraso} : String ; DividaAtraso : Char{A/D - Verifica Atraso / Divida}) :Integer;
var
sSql : String;
begin

   {Result da função==>
    0 - Houve erro na função(não foram passados corretamente os parâmetros)
    1 - O participante têm dívida / Atraso
    2 - O partcicpante não têm dívida/ Atraso }

   Result := 0 ;

   if (IdTitular = '') or (IdDependente = '') or ((DividaAtraso <> 'A') and (DividaAtraso <> 'D')) then Exit;
   if (DividaAtraso =  'A' ) and ( Data = '' ) then Exit;

   sSQL := '';

   if DividaAtraso = 'A' then
   begin
      sSQL := 'SELECT IDTITULAR, SITRECEBIMENTO '+
              ' FROM HSTCONTRIBASS '+
              ' WHERE '+
              '  DATAPREVISAO <= TO_DATE('''+Data+''',''DD/MM/YYYY'') AND  '+
              '  SITRECEBIMENTO NOT IN (''0'',''1'',''2'') AND '+
              '  IDTITULAR =  '+IdTitular+' AND '+
              '  IDDEPENDENTE  =  '+IdDependente+' AND '+
              '  VALORESPERADO > VALORRECEBIDO ';
   end
   else if DividaAtraso = 'D' then
   begin
      sSQL := 'SELECT IDTITULAR, SITRECEBIMENTO '+
              ' FROM HSTCONTRIBASS '+
              ' WHERE '+
              '     SITRECEBIMENTO NOT IN (''2'',''5'') '+
              ' AND IDTITULAR =  '+IdTitular+' '+
              ' AND IDDEPENDENTE  =  '+IdDependente+' ';
   end;


   qryassist.close;
   qryassist.sql.clear;
   qryassist.sql.add(sSql);
   try
      qryassist.open;
   except
      Exit;
   end;

   if qryassist.isempty then
   Result := 2
      else Result := 1;

end;

//volta a data do último evento assistencial
function DataUltEvento(sidpessjur,sidtitular,siddependente,sidplanass,sidplanoprev: String) : String;
var qryevento : Twwquery;
begin

   qryevento := TwwQuery.Create(Application);
   qryevento.DatabaseName := 'BaseDados';

   qryevento.close;
   qryevento.sql.clear;
   qryevento.sql.add(' SELECT MAX(DATAEVENT) DATA '+
                     ' FROM EVENTASS '+
                     ' WHERE '+
                     ' IDTITULAR = '''+sidtitular+''' '+
                     ' AND IDPLANASS = '''+sidplanass+''' '+
                     ' AND IDPESSJUR = '''+sidpessjur+''' '+
                     ' AND IDPLANOPREV = '''+sidplanoprev+''' '+
                     ' AND IDDEPENDENTE = '''+siddependente+''' ');
   try
      qryevento.open;
   except
   end;

   if qryevento.isempty then
   result := ''
   else result := qryevento.fieldbyname('DATA').AsString;

   qryevento.free;
end;

function DiasAtraso(sidpessjur,sidtitular,siddependente,sidplanass,sidplanoprev : String) : Integer;
var qrycont : Twwquery;
    UltData : String;
begin

   qrycont := TwwQuery.Create(Application);
   qrycont.DatabaseName := 'BaseDados';

   qrycont.close;
   qrycont.sql.clear;
   qrycont.sql.add(' SELECT MAX(DATAPREVISAO) DATA '+
                   ' FROM HSTCONTRIBASS '+
                   ' WHERE '+
                   ' IDTITULAR = '''+sidtitular+''' '+
                   ' AND IDPLANASS = '''+sidplanass+''' '+
                   ' AND IDPESSJUR = '''+sidpessjur+''' '+
                   ' AND IDPLANOPREV = '''+sidplanoprev+''' '+
                   ' AND IDDEPENDENTE = '''+siddependente+''' ');
   try
      qrycont.open;
   except
   end;

   if qrycont.isempty then
   UltData := ''
   else Ultdata := qrycont.fieldbyname('DATA').AsString;

   if Ultdata = '' then
   begin
      result := 0;
      qrycont.free;
      exit;
   end;

   qrycont.close;
   qrycont.sql.clear;
   qrycont.sql.add(' SELECT SYSDATE - TO_DATE('''+UltData+''',''DD/MM/YYYY'') DIAS '+
                   ' FROM DUAL ');
   try
      qrycont.open;
   except
   end;

   if qrycont.isempty then
   result := 0
   else
   begin
      if qrycont.fieldbyname('DIAS').AsInteger < 0 then
      result := 0
      else result := qrycont.fieldbyname('DIAS').AsInteger;
   end;

   qrycont.free;

end;


function MensAtraso(sidpessjur,sidtitular,siddependente,sidplanass,sidplanoprev : String) : Integer;
var
 qrycont : Twwquery;
begin

   qrycont := TwwQuery.Create(Application);
   qrycont.DatabaseName := 'BaseDados';

   qrycont.close;
   qrycont.sql.clear;
   qrycont.sql.add(' SELECT COUNT(IDTITULAR) NUM '+
                   ' FROM HSTCONTRIBASS '+
                   ' WHERE '+
                   ' IDTITULAR = '''+sidtitular+''' '+
                   ' AND IDPLANASS = '''+sidplanass+''' '+
                   ' AND IDPESSJUR = '''+sidpessjur+''' '+
                   ' AND IDPLANOPREV = '''+sidplanoprev+''' '+
                   ' AND IDDEPENDENTE = '''+siddependente+''' '+
                   ' AND DATAPREVISAO < SYSDATE '+
                   ' AND (VALORESPERADO = 0 OR VALORESPERADO IS NULL)');
   try
      qrycont.open;
   except
   end;

   if qrycont.isempty then
   Result := 0
   else Result := qrycont.fieldbyname('NUM').AsInteger;

end;

function TruncaRound(f:String;n:integer):string;
var
 i,j:integer;
 rInteiro : Extended;
 cAux :Char;
begin
   cAux := DecimalSeparator;
   Result := (f);

   i:=pos(',',result);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',result);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if (i <> 0) and (length(copy(result,i+1,length(result)))>n) then
   begin
       rInteiro := strtofloat(f)*power(10,n);
       j := pos(DecimalSeparator,floattostr(rinteiro));
       if j <> 0 then  rInteiro := ArredondaValor(floattostr(rinteiro));
       rInteiro := rInteiro/power(10,n);
       Result := copy(floattostr(rinteiro),1,i+n)
   end;
   DecimalSeparator := cAux;
end;

function ArredondaValor(Valor : String) : Extended;
var cAux : Char;
    i : Integer;
    sValorInt, sValorDec : String;
    dValorInt , dValorDec : Extended;
begin
   cAux := DecimalSeparator;

   if Valor = '' then
   begin
      Result := 0;
      exit;
   end;

   i:=pos(',',Valor);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',Valor);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if i <> 0 then
   begin
      sValorInt := Copy(valor,0,i-1);
      sValorDec := Copy(valor,i+1,1);
      dValorInt := strtofloat(sValorInt);
      dValorDec := strtofloat(sValorDec);

      if dValorDec >= 5 then
      dValorInt := dValorInt + 1;
   end
   else dValorInt := StrToFloat(Valor);


   Result := dValorInt;
   DecimalSeparator := cAux;
end;


end.
