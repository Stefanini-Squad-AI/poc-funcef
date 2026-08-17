unit UModuloInvestImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ComCtrls, CMTree, DBCtrls, DBCtrls2, wwdblook, StdCtrls, ExtCtrls, Mask,
  Buttons, DBTables, wwDatsrc, wwQuery, wwDBGrid;

   // função de manipulação de strings
   function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   function DataExtenso(dData: TDateTime): string;

   // verifica duplicidade em uma query ANTES do CmeCadastro.Confirma(Self)
   function VerificaLinhaGrid(qry: TwwQuery; iTagChave, iTagVazio: integer; sTabelaMensagem: string;
                              bPermiteChaveVazia: boolean): boolean;

   // transfere um ou mais registros de um grid para outro
   procedure MoveRegistros(grdOrigem, grdDestino : TwwDBGrid);



type
   TModulo = Class

   private
      FExemplo : string;

   public
      // variáveis necessárias para se controlar integrações
      bIntegraCAPCAR    : boolean; // Contas a Pagar / Receber
      bIntegraContab    : boolean; // Contabilidade
      bIntegraGestao    : boolean; // Gestão de Investimentos
      bIntegraAtivo     : boolean; // Ativo Fixo
      bIntegraOrcamento : boolean; // Orçamento

      // valores default p/ Entidade Contábil e Patrocinadora
      iPlanoPrevGlobal  : integer;
      iPatroGlobal      : integer;

      // valores default p/ Programa e Centro de Custo
      iPrograma         : integer;
      sCentrocusto      : string;

      // máscaras dos Tipos de Recebimento / Desembolso
      sMascaraReceb     : string;
      sMascaraDesemb    : string;

      // uso de Centro de Responsabilidade e Unidade de Negócios + seus valores padrão
      bUsaCentRespon    : boolean;
      bUsaUnidNegoc     : boolean;

      sCentroRespon     : string;
      iUnidNegoc        : integer;

      // Moeda corrente dos sistemas
      iMoedaCorrente    : integer;

      // Valor da 1ª cota de uma carteira de investimentos
      fVlrPrimeiraCota  : currency;

		property Exemplo : string read FExemplo write FExemplo;
	end;


var
  Modulo : TModulo;



implementation
uses
  uDataBase, Math;




function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
  i, iRepeticoes : integer;
  sAux : string;
begin
   sAux := '';

   iRepeticoes := iLimiteTamanho - length(sOriginal);

   for i := 1 to iRepeticoes do sAux := sAux + sCompleta;

   Result := sAux + sOriginal;
end;





function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
  i, iRepeticoes : integer;
  sAux : string;
begin
   sAux := '';

   iRepeticoes := iLimiteTamanho - length(sOriginal);

   for i := 1 to iRepeticoes do sAux := sAux + sCompleta;

   Result := sOriginal + sAux;
end;





function DataExtenso(dData: TDateTime): string;
var
   iAno, iMes, iDia: word;
   sAno, sMesExtenso, sDia: string;
begin
   DecodeDate(dData, iAno, iMes, iDia);

   sAno  := IntToStr(iAno);

   Case iMes of
      1  : sMesExtenso := 'janeiro';
      2  : sMesExtenso := 'fevereiro';
      3  : sMesExtenso := 'março';
      4  : sMesExtenso := 'abril';
      5  : sMesExtenso := 'maio';
      6  : sMesExtenso := 'junho';
      7  : sMesExtenso := 'julho';
      8  : sMesExtenso := 'agosto';
      9  : sMesExtenso := 'setembro';
      10 : sMesExtenso := 'outubro';
      11 : sMesExtenso := 'novembro';
      12 : sMesExtenso := 'dezembro';
   end;

   sDia  := IntToStr(iDia);
   if length(sDia) = 1 then sDia := '0' + sDia;

   Result := sDia + ' de ' + sMesExtenso + ' de ' + sAno;
end;





function VerificaLinhaGrid(qry: TwwQuery; iTagChave, iTagVazio: integer; sTabelaMensagem: string;
                           bPermiteChaveVazia: boolean): boolean;
var
   x           : integer;
   sChave      : string;
   ListaChave  : TStrings;
begin
   ListaChave := TStringList.Create;

   if qry.isEmpty then begin
      Result := True;
      Exit;
   end;

   try
      qry.First;

      while not(qry.EOF) do begin

         sChave := '';

         for x := 0 to qry.FieldCount - 1 do begin
            if ( (qry.Fields[X].Tag = iTagChave) or (qry.Fields[X].Tag = iTagVazio) ) then begin
               sChave  := sChave + Trim(qry.Fields[X].asString);
               if ( (not(bPermiteChaveVazia)) and (qry.Fields[X].Tag <> iTagVazio) ) then begin
                  if qry.Fields[X].IsNull then begin
                     Application.MessageBox(PChar('O Campo ' + qry.Fields[X].DisPlayLabel + ' do Cadastro de ' + sTabelaMensagem + ' não foi informado'),'Atenção',Mb_IconInformation);
                     Result := False;
                     Exit;
                  end;
               end;
            end;
         end;

         if ListaChave.IndexOf(sChave) <> -1 then begin
               Application.MessageBox(PChar('O Cadastro de ' + sTabelaMensagem + ' contém um registro repetido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
         end else
            if sChave = '' then begin
               Application.MessageBox(Pchar('O Cadastro de ' + sTabelaMensagem + ' contém um registro não preenchido'),'Atenção',Mb_IconInformation);
               Result := False;
               Exit;
            end else
               ListaChave.Add(sChave);

         qry.Next;

      end;

      qry.First;
      Result := True;

   finally
      ListaChave.Free;
   end;
end;





procedure MoveRegistros(grdOrigem, grdDestino : TwwDBGrid);
var
   x, y, iTotCampos: integer;
begin
   if ( not(grdOrigem.DataSource.DataSet.IsEmpty) and (grdOrigem.SelectedList.Count > 0) ) then begin

      for y := 0 to grdOrigem.SelectedList.Count - 1 do begin

         grdOrigem.DataSource.DataSet.GotoBookmark(grdOrigem.SelectedList[y]);
         grdDestino.DataSource.DataSet.Append;
         iTotCampos := grdOrigem.DataSource.DataSet.FieldCount - 1;

         for x := 0 to iTotCampos do begin
            grdDestino.DataSource.DataSet.Fields[x].Value := grdOrigem.DataSource.DataSet.Fields[x].Value;
         end;

         grdDestino.DataSource.DataSet.Post;
         grdOrigem.DataSource.DataSet.Delete;

      end;

      grdOrigem.SelectedList.Clear;
      grdDestino.DataSource.Dataset.First;
      grdOrigem.DataSource.Dataset.First;

   end;
end;





end.
