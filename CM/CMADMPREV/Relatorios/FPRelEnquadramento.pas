// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FPRelEnquadramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  MontaSelect;

type
  TfrmPRelEnquadramento = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edPlano: TEdit;
    edNumInsc: TEdit;
    edMatricula: TEdit;
    bbtnProcurar: TBitBtn;
    MontaSelectPart: TMontaSelect;
    qryAux: TwwQuery;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sIdPessoa,    sIdPessJur,  sIdPlanoPrev  : string;
    varFields : variant;
  public
    { Public declarations }
    procedure AtualizaTabelaValoresPBC ( psMesAno : string;
                                         piGrupo,
                                         piColuna : word;
                                         psValor  : string );
  end;

var
  frmPRelEnquadramento: TfrmPRelEnquadramento;

implementation

uses DRelatEspecificos, UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmPRelEnquadramento.AtualizaTabelaValoresPBC ( psMesAno : string;
                                                           piGrupo,
                                                           piColuna : word;
                                                           psValor  : string );
var sNomeColuna : string;
    i           : word;
begin

   varFields[0] := psMesAno;
   varFields[1] := piGrupo;
   sNomeColuna  := 'COLUNA'+IntToStr(piColuna);

   i := Pos('R$', psValor);
   if i  > 0
   then psValor := Copy(psValor, i+2, Length(psValor) - i - 1);
   psValor := ClienteNumero(Trim(psValor));

   try
      StrToFloat(ClienteNumero(psValor));
   except
      exit;
   end;

   if dtmRelatEspecificos.qryEnqSecao4.Locate('MESANO;GRUPO', varFields, [loCaseInsensitive])
   then begin
      dtmRelatEspecificos.qryEnqSecao4.Edit;
      dtmRelatEspecificos.qryEnqSecao4.FieldByName(sNomeColuna).AsFloat := StrToFloat(ClienteNumero(psValor));
      dtmRelatEspecificos.qryEnqSecao4.Post;
   end;

   // Somar valor na coluna de totais (grupo 3, coluna 5)
   varFields[0] := psMesAno;
   varFields[1] := 3;
   sNomeColuna  := 'COLUNA5';
   if dtmRelatEspecificos.qryEnqSecao4.Locate('MESANO;GRUPO', varFields, [loCaseInsensitive])
   then begin
      dtmRelatEspecificos.qryEnqSecao4.Edit;
      dtmRelatEspecificos.qryEnqSecao4.FieldByName(sNomeColuna).AsFloat :=
      dtmRelatEspecificos.qryEnqSecao4.FieldByName(sNomeColuna).AsFloat + 
      StrToFloat(ClienteNumero(psValor));
      dtmRelatEspecificos.qryEnqSecao4.Post;
   end;

end;


procedure TfrmPRelEnquadramento.bbtnProcurarClick(Sender: TObject);
begin
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     sIdPessoa        := MontaSelectPart.ValoresChave[0];
     sIdPessJur       := MontaSelectPart.ValoresChave[1];
     sIdPlanoPrev     := MontaSelectPart.ValoresChave[2];
     edNome.Text      := MontaSelectPart.ValoresChave[3];
     edMatricula.Text := MontaSelectPart.ValoresChave[4];
     edPatro.Text     := MontaSelectPart.ValoresChave[5];
     edPlano.Text     := MontaSelectPart.ValoresChave[6];
     edNumInsc.Text   := MontaSelectPart.ValoresChave[7];
  end;
end;

procedure TfrmPRelEnquadramento.bbtnConfirmarClick(Sender: TObject);
var sMesAno,
    sAnoMesAtual,
    sMenorAnoMes,
    sMaiorAnoMes,
    sDescricao       : string;
    iGrupo,
    iColuna          : integer;
    iContParada      : word;
    sStringAux       : string;
    i                : word;
    bInsere,
    bAchouLinhaVazia : boolean;
begin
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Selecione o Participante ou Beneficiário.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;

  with dtmRelatEspecificos do
  begin
     //  OBTER DADOS DA FUNDAÇÃO
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     with qryEnquadramento do
     begin
        Close;
        ParamByName('IDPESSOA').AsInteger      := StrToInt(sIdPessoa);
        Open;
     end;

     with qryEnqSecao1 do
     begin
        Close;
        Open;
        if not IsEmpty
        then begin
           while not Eof do
           begin
              Delete;
              Next;
           end;
        end;
     end;

     with qryEnqSecao2 do
     begin
        Close;
        Open;
        if not IsEmpty
        then begin
           while not Eof do
           begin
              Delete;
              Next;
           end;
        end;
     end;

     with qryEnqSecao3 do
     begin
        Close;
        Open;
        if not IsEmpty
        then begin
           while not Eof do
           begin
              Delete;
              Next;
           end;
        end;
     end;

     with qryEnqSecao4  do
     begin
        Close;
        Open;
        if not IsEmpty
        then begin
           while not Eof do
           begin
              Delete;
              Next;
           end;
        end;
     end;
   end; // with dtmRelatEspecificos

   varFields     := VarArrayCreate([0,1],varVariant);

   // **************************************************************************
   //  PREENCHER QUERY SECAO 1 COM AS FUNCOES E SEUS DADOS, GRAVADOS NA DETCALCULO
   // **************************************************************************
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  EV.IDPESSOA, EV.DATAINICIO, EV.DATAFINAL,   '+
              '         CEXT.CODIGO AS CODIGO, CEXT.TITULO AS NOME, '+
              '         D.DESCRICAO, D.VALOR                                     '+
              ' FROM    PESSOA P, PESSOA PAT, PESSOAFISICA PF, EVOLFUNCPREV EV , '+
              '         CARGOEXT CEXT, DETCALCULO D                              '+
              ' WHERE   EV.IDPESSOA       = '+sIdPessoa+
              ' AND     P.IDPESSOA        = EV.IDPESSOA   '+
              ' AND     PF.IDPESSOA       = EV.IDPESSOA   '+
              ' AND     PAT.IDPESSOA      = EV.IDPESSJUR  '+
              ' AND     CEXT.IDCARGOEXT   = EV.IDFUNCAO   '+
              ' AND     D.IDPESSOA        = EV.IDPESSOA   '+
              ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO  '+
              '                          WHERE  IDPESSOA = '+sIdPessoa+
              '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
              ' AND     ((D.DESCRICAO LIKE ''%CODFUNC/%/MODO%'') OR (D.DESCRICAO LIKE ''%CODACPF/%/MODO%'') ) '+
              ' AND     SUBSTR(D.VALOR(+),1,3) = RTRIM(CEXT.CODIGO) '+
              ' ORDER BY EV.DATAINICIO ' );
      Open;

      First;
      while not Eof do
      begin

         // Verificar se a funcao já nao foi incluida pela data inicio e codigo
         // Se nao encontrar, verificar se a desccontrole já foi incluida
         // Se nao encontrar, entao inserir
         varFields[0] := FieldByName('DATAINICIO').AsString;
         varFields[1] := FieldByName('CODIGO').AsString;
         bInsere      := True;

         with dtmRelatEspecificos.qryEnqSecao1 do
         begin
            First;
            while not Eof do
            begin
               if (Trim(FieldByName('DATACONTROLE').AsString) = Trim(qryAux.FieldByName('DATAINICIO').AsString)) and
                  (Trim(FieldByName('CODIGO').AsString)       = Trim(qryAux.FieldByName('CODIGO').AsString))
               then begin
                  bInsere := False;
                  break;
               end
               else if Trim(FieldByName('DESCCONTROLE').AsString) = Trim(Copy(qryAux.FieldByName('DESCRICAO').AsString,1,30))
                    then begin
                       bInsere := False;
                       break;
                    end;
               Next;
            end; // while not Eof
         end;

         if bInsere
         then begin
           dtmRelatEspecificos.qryEnqSecao1.Insert;
           dtmRelatEspecificos.qryEnqSecao1.FieldByName('CODIGO').AsString     := FieldByName('CODIGO').AsString;
           dtmRelatEspecificos.qryEnqSecao1.FieldByName('DATAINICIO').AsString := FieldByName('DATAINICIO').AsString;
           dtmRelatEspecificos.qryEnqSecao1.FieldByName('DATAFINAL').AsString  := FieldByName('DATAFINAL').AsString;
           dtmRelatEspecificos.qryEnqSecao1.FieldByName('NOME').AsString       := FieldByName('NOME').AsString;

           sStringAux := FieldByName('VALOR').AsString;
           i := Pos('/',sStringAux);
           sStringAux := Copy(sStringAux,i+1, Length(sStringAux) - i);
           i := Pos('/',sStringAux);
           dtmRelatEspecificos.qryEnqSecao1.FieldByName('PERCPBC').AsString := ClienteNumero(Copy(sStringAux,1,i-1));

           if Pos('ACPF', FieldByName('DESCRICAO').AsString) > 0
           then dtmRelatEspecificos.qryEnqSecao1.FieldByName('MODO').AsString    := 'AC'
           else dtmRelatEspecificos.qryEnqSecao1.FieldByName('MODO').AsString    := Copy(sStringAux,i+1,2);
           dtmRelatEspecificos.qryEnqSecao1.FieldByName('DATACONTROLE').AsString := FieldByName('DATAINICIO').AsString;
           dtmRelatEspecificos.qryEnqSecao1.FieldByName('DESCCONTROLE').AsString := Copy(FieldByName('DESCRICAO').AsString, 1,30);
           dtmRelatEspecificos.qryEnqSecao1.Post;
         end;
         Next;
      end;
   end;

   // *************************************************************************************
   // PREENCHER QUERY SECAO 2 COM OS QUADROS COMPONENTES X VALOR E COMPONENTES X PERCENTUAL
   // *************************************************************************************
   bAchouLinhaVazia := False;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  1 AS ORDEM,                                                     '+
              '         D.IDPESSOA,                                                     '+
              '         '' '' AS NOMEITEM,                                              '+
              '         REPLACE(REPLACE(D.DESCRICAO, ''DIB'',''''), '':'', '''') AS DESCITEM, '+
              '         D.VALOR AS VALORITEM                                            '+
              ' FROM    DETCALCULO D                                                    '+
              ' WHERE   D.IDPESSOA  = '+sIdPessoa+
              ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO          '+
              '                          WHERE  IDPESSOA = '+sIdPessoa+
              '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
              ' AND     D.DESCRICAO LIKE ''%DIB%''                                                    '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODFUNC%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODACPF%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%BNH%'')                                              '+
              ' AND     NOT (D.DESCRICAO LIKE ''%ENQUADRAMENTO%'')                                    '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CÓDIGO%'')                                           '+
              ' UNION                                                                                 '+
              ' SELECT  2 AS ORDEM,                                                                   '+
              '         D.IDPESSOA,                                                                   '+
              '         ''Outras Rubricas Salariais'' AS NOMEITEM,                                    '+
              '         REPLACE(REPLACE(D.DESCRICAO, ''DIB'',''''), '':'', '''') AS DESCITEM, '+
              '         D.VALOR AS VALORITEM                                                          '+
              ' FROM    DETCALCULO D                                                                  '+
              ' WHERE   D.IDPESSOA  = '+sIdPessoa+
              ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO                        '+
              '                          WHERE  IDPESSOA = '+sIdPessoa+
              '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
              ' AND     D.DESCRICAO LIKE ''%BNH%DIB%''                                                '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODFUNC%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODACPF%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%ENQUADRAMENTO%'')                                    '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CÓDIGO%'')                                           '+
              ' ORDER BY ORDEM ');
      Open;

      // Inserir tudo que não é percentual
      First;
      while not Eof do
      begin
         if Pos('%',FieldByName('DESCITEM').AsString) > 0
         then begin
            Next;
            continue;
         end;

         dtmRelatEspecificos.qryEnqSecao2.Append;
         dtmRelatEspecificos.qryEnqSecao2.FieldByName('ORDEM').AsString     := FieldByName('ORDEM').AsString;
         dtmRelatEspecificos.qryEnqSecao2.FieldByName('IDPESSOA').AsString  := FieldByName('IDPESSOA').AsString;
         dtmRelatEspecificos.qryEnqSecao2.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
         dtmRelatEspecificos.qryEnqSecao2.FieldByName('DESCITEM').AsString      := FieldByName('DESCITEM').AsString;
         dtmRelatEspecificos.qryEnqSecao2.FieldByName('VALORITEM').AsFloat      := StrToFloat(ClienteNumero(FieldByName('VALORITEM').AsString));
         dtmRelatEspecificos.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := '';
         dtmRelatEspecificos.qryEnqSecao2.FieldByName('PERCITEM').AsFloat       := 0;
         dtmRelatEspecificos.qryEnqSecao2.Post;

         Next;
      end; // while

      // Inserir os percentuais
      First;
      while not Eof do
      begin
         if Pos('%',FieldByName('DESCITEM').AsString) <= 0
         then begin
            Next;
            continue;
         end;

         if dtmRelatEspecificos.qryEnqSecao2.IsEmpty
         then begin
            dtmRelatEspecificos.qryEnqSecao2.Append;
            dtmRelatEspecificos.qryEnqSecao2.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
            dtmRelatEspecificos.qryEnqSecao2.FieldByName('DESCITEM').AsString      := '';
            dtmRelatEspecificos.qryEnqSecao2.FieldByName('VALORITEM').AsFloat      := 0;
            dtmRelatEspecificos.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := FieldByName('DESCITEM').AsString;
            dtmRelatEspecificos.qryEnqSecao2.FieldByName('PERCITEM').AsFloat       := StrToFloat(ClienteNumero(FieldByName('VALORITEM').AsString));
            dtmRelatEspecificos.qryEnqSecao2.Post;
         end
         else begin
            dtmRelatEspecificos.qryEnqSecao2.First;
            while not dtmRelatEspecificos.qryEnqSecao2.Eof do
            begin
               if dtmRelatEspecificos.qryEnqSecao2.FieldbyName('DESCITEMPERC').AsString = ''
               then begin
                  bAchouLinhaVazia := True;
                  dtmRelatEspecificos.qryEnqSecao2.Edit;
                  dtmRelatEspecificos.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := FieldByName('DESCITEM').AsString;
                  dtmRelatEspecificos.qryEnqSecao2.FieldByName('PERCITEM').AsFloat       := StrToFloat(ClienteNumero(FieldByName('VALORITEM').AsString));
                  dtmRelatEspecificos.qryEnqSecao2.Post;
                  break;
               end;
               dtmRelatEspecificos.qryEnqSecao2.Next;
            end;

            if not bAchouLinhaVazia
            then begin
               dtmRelatEspecificos.qryEnqSecao2.Append;
               dtmRelatEspecificos.qryEnqSecao2.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
               dtmRelatEspecificos.qryEnqSecao2.FieldByName('DESCITEM').AsString      := '';
               dtmRelatEspecificos.qryEnqSecao2.FieldByName('VALORITEM').AsFloat      := 0;
               dtmRelatEspecificos.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := FieldByName('DESCITEM').AsString;
               dtmRelatEspecificos.qryEnqSecao2.FieldByName('PERCITEM').AsFloat       := StrToFloat(ClienteNumero(FieldByName('VALORITEM').AsString));
               dtmRelatEspecificos.qryEnqSecao2.Post;
            end;
         end;
         Next;
      end;
   end;
   dtmRelatEspecificos.qryEnqSecao2.First;

   // *************************************************************************************
   // PREENCHER QUERY SECAO 3 COM OS QUADROS COMPONENTES X VALOR E COMPONENTES X PERCENTUAL
   // *************************************************************************************
   bAchouLinhaVazia := False;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  1 AS ORDEM,                                                              '+
              '         D.IDPESSOA,                                                              '+
              '         '' '' AS NOMEITEM,                                                       '+
              '         REPLACE(REPLACE(D.DESCRICAO, ''MÉDIO'',''''), '':'', '''') AS DESCITEM,  '+
              '         D.VALOR  AS VALORITEM                                                    '+
              ' FROM    DETCALCULO D                                                             '+
              ' WHERE   D.IDPESSOA  = '+sIdPessoa+
              ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO                   '+
              '                          WHERE  IDPESSOA = '+sIdPessoa+
              '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
              ' AND     D.DESCRICAO LIKE ''%MÉDIO%''                                             '+
              ' AND     NOT (D.DESCRICAO LIKE ''%BNH%'' )                                        '+
              ' AND     NOT (D.DESCRICAO LIKE ''%ENQUADRAMENTO%'')                               '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CÓDIGO%'')                                      '+
              ' UNION                                                                            '+
              ' SELECT  2 AS ORDEM,                                                              '+
              '         D.IDPESSOA,                                                              '+
              '         ''Outras Rubricas Salariais'' AS NOMEITEM,                               '+
              '         REPLACE(REPLACE(D.DESCRICAO, ''MÉDIO'',''''), '':'', '''') AS DESCITEM,  '+
              '         D.VALOR AS VALORITEM                                                     '+
              ' FROM    DETCALCULO D                                                             '+
              ' WHERE   D.IDPESSOA  = '+sIdPessoa+
              ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO                   '+
              '                          WHERE  IDPESSOA = '+sIdPessoa+
              '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
              ' AND     D.DESCRICAO LIKE ''%BNH%MÉDIO%''                                         '+
              ' AND     NOT (D.DESCRICAO LIKE ''%ENQUADRAMENTO%'')                               '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CÓDIGO%'')                                      '+
              ' ORDER BY ORDEM ');
      Open;

      // Inserir tudo que não é percentual
      First;
      while not Eof do
      begin
         if Pos('%',FieldByName('DESCITEM').AsString) > 0
         then begin
            Next;
            continue;
         end;

         dtmRelatEspecificos.qryEnqSecao3.Append;
         dtmRelatEspecificos.qryEnqSecao3.FieldByName('ORDEM').AsString         := FieldByName('ORDEM').AsString;
         dtmRelatEspecificos.qryEnqSecao3.FieldByName('IDPESSOA').AsString      := FieldByName('IDPESSOA').AsString;
         dtmRelatEspecificos.qryEnqSecao3.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
         dtmRelatEspecificos.qryEnqSecao3.FieldByName('DESCITEM').AsString      := FieldByName('DESCITEM').AsString;
         dtmRelatEspecificos.qryEnqSecao3.FieldByName('VALORITEM').AsFloat      := StrToFloat(ClienteNumero(FieldByName('VALORITEM').AsString));
         dtmRelatEspecificos.qryEnqSecao3.FieldByName('DESCITEMPERC').AsString  := '';
         dtmRelatEspecificos.qryEnqSecao3.FieldByName('PERCITEM').AsFloat       := 0;
         dtmRelatEspecificos.qryEnqSecao3.Post;

         Next;
      end; // while

      // Inserir os percentuais
      First;
      while not Eof do
      begin
         if Pos('%',FieldByName('DESCITEM').AsString) <= 0
         then begin
            Next;
            continue;
         end;

         if dtmRelatEspecificos.qryEnqSecao3.IsEmpty
         then begin
            dtmRelatEspecificos.qryEnqSecao3.Append;
            dtmRelatEspecificos.qryEnqSecao3.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
            dtmRelatEspecificos.qryEnqSecao3.FieldByName('DESCITEM').AsString      := '';
            dtmRelatEspecificos.qryEnqSecao3.FieldByName('VALORITEM').AsFloat      := 0;
            dtmRelatEspecificos.qryEnqSecao3.FieldByName('DESCITEMPERC').AsString  := FieldByName('DESCITEM').AsString;
            dtmRelatEspecificos.qryEnqSecao3.FieldByName('PERCITEM').AsFloat       := StrToFloat(ClienteNumero(FieldByName('VALORITEM').AsString));
            dtmRelatEspecificos.qryEnqSecao3.Post;
         end
         else begin
            dtmRelatEspecificos.qryEnqSecao3.First;
            while not dtmRelatEspecificos.qryEnqSecao3.Eof do
            begin
               if dtmRelatEspecificos.qryEnqSecao3.FieldbyName('DESCITEMPERC').AsString = ''
               then begin
                  bAchouLinhaVazia := True;
                  dtmRelatEspecificos.qryEnqSecao3.Edit;
                  dtmRelatEspecificos.qryEnqSecao3.FieldByName('DESCITEMPERC').AsString  := FieldByName('DESCITEM').AsString;
                  dtmRelatEspecificos.qryEnqSecao3.FieldByName('PERCITEM').AsFloat       := StrToFloat(ClienteNumero(FieldByName('VALORITEM').AsString));
                  dtmRelatEspecificos.qryEnqSecao3.Post;
                  break;
               end;
               dtmRelatEspecificos.qryEnqSecao3.Next;
            end;

            if not bAchouLinhaVazia
            then begin
               dtmRelatEspecificos.qryEnqSecao3.Append;
               dtmRelatEspecificos.qryEnqSecao3.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
               dtmRelatEspecificos.qryEnqSecao3.FieldByName('DESCITEM').AsString      := '';
               dtmRelatEspecificos.qryEnqSecao3.FieldByName('VALORITEM').AsFloat      := 0;
               dtmRelatEspecificos.qryEnqSecao3.FieldByName('DESCITEMPERC').AsString  := FieldByName('DESCITEM').AsString;
               dtmRelatEspecificos.qryEnqSecao3.FieldByName('PERCITEM').AsFloat       := StrToFloat(ClienteNumero(FieldByName('VALORITEM').AsString));
               dtmRelatEspecificos.qryEnqSecao3.Post;
            end;
         end;
         Next;
      end;
   end;
   dtmRelatEspecificos.qryEnqSecao3.First;

   // **************************************************************************
   // PREENCHER QUERY SECAO 4 COM O QUADRO POR MES X TIPO X VALOR
   // **************************************************************************
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDCALCULO, IDDETCALCULO, IDREGRA, DESCRICAO, VALOR    '+
              ' FROM   DETCALCULO                                            '+
              ' WHERE  IDPESSOA = '+sIdPessoa+
              ' AND    IDCALCULO IN ( SELECT MAX(IDCALCULO) FROM DETCALCULO  '+
              '                       WHERE  IDPESSOA = '+sIdPessoa+
              '                       AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
              ' AND    DESCRICAO NOT LIKE ''%DIB%''   '+
              ' AND    DESCRICAO NOT LIKE ''%MÉDIO%'' '+
              ' ORDER BY IDDETCALCULO ');
      Open;
      First;

      // Preencher menor e maior ano/mes, para, depois de preencher todos os dados existentes
      // na detcalculo, completar com zeros os dados remanescentes.
      sMenorAnoMes  := '9999/99';
      sMaiorAnoMes  := '0000/00';
      while not Eof do
      begin
         sDescricao := UpperCase(FieldByName('DESCRICAO').AsString);
         if Pos('MES REFERENCIA PBC', sDescricao) > 0
         then begin
            sMesAno := Copy(FieldbyName('VALOR').AsString,6,2)+'/'+Copy(FieldbyName('VALOR').AsString,1,4);
            // Preencher menor e maior ano/mes, para, depois de preencher todos os dados existentes
            // na detcalculo, completar com zeros os dados remanescentes.
            if Copy(sMesAno,4,4)+'/'+Copy(sMesAno,1,2) < sMenorAnoMes
            then sMenorAnoMes := Copy(sMesAno,4,4)+'/'+Copy(sMesAno,1,2);

            if Copy(sMesAno,4,4)+'/'+Copy(sMesAno,1,2) > sMaiorAnoMes
            then sMaiorAnoMes := Copy(sMesAno,4,4)+'/'+Copy(sMesAno,1,2);
         end;
         Next;
      end;

      // Preencher a query toda com zero
      for iGrupo := 1 to 3 do
      begin
         sAnoMesAtual := sMaiorAnoMes;
         while sAnoMesAtual >= sMenorAnoMes do
         begin
            dtmRelatEspecificos.qryEnqSecao4.Append;
            dtmRelatEspecificos.qryEnqSecao4.FieldByName('GRUPO').AsInteger := iGrupo;
            dtmRelatEspecificos.qryEnqSecao4.FieldByName('MESANO').AsString := Copy(sAnoMesAtual,6,2)+'/'+Copy(sAnoMesAtual,1,4);
            dtmRelatEspecificos.qryEnqSecao4.FieldByName('COLUNA1').AsFloat := 0;
            dtmRelatEspecificos.qryEnqSecao4.FieldByName('COLUNA2').AsFloat := 0;
            dtmRelatEspecificos.qryEnqSecao4.FieldByName('COLUNA3').AsFloat := 0;
            dtmRelatEspecificos.qryEnqSecao4.FieldByName('COLUNA4').AsFloat := 0;
            dtmRelatEspecificos.qryEnqSecao4.FieldByName('COLUNA5').AsFloat := 0;
            dtmRelatEspecificos.qryEnqSecao4.Post;
            sAnoMesAtual := SAnoMesAnterior(sAnoMesAtual);
         end; // while
      end;

      First;

      // Preencher os CARGOS, FUNÇÕES E ADICIONAL COMPENSATORIO, que estarão gravados na DETCALCULO
      // no formato PREFIXO(3)+ANO(4)+MES(2), onde os prefixos são : CAR - CARGO, FUN - FUNCAO,
      // ADC - ADICIONAL COMPENSATORIO
      while not Eof do
      begin
         if Copy(FieldbyName('DESCRICAO').AsString,1,3) = 'CAR'
         then begin
            sMesAno := Copy(FieldbyName('DESCRICAO').AsString,8,2)+'/'+Copy(FieldbyName('DESCRICAO').AsString,4,4);
            AtualizaTabelaValoresPBC ( sMesAno, 1, 1, FieldbyName('VALOR').AsString);
         end
         else if Copy(FieldbyName('DESCRICAO').AsString,1,3) = 'FUN'
         then begin
            sMesAno := Copy(FieldbyName('DESCRICAO').AsString,8,2)+'/'+Copy(FieldbyName('DESCRICAO').AsString,4,4);
            AtualizaTabelaValoresPBC ( sMesAno, 1, 2, FieldbyName('VALOR').AsString);
         end
         else if Copy(FieldbyName('DESCRICAO').AsString,1,3) = 'ADC'
         then begin
            sMesAno := Copy(FieldbyName('DESCRICAO').AsString,8,2)+'/'+Copy(FieldbyName('DESCRICAO').AsString,4,4);
            AtualizaTabelaValoresPBC ( sMesAno, 2, 4, FieldbyName('VALOR').AsString);
         end;
         Next;
      end;

      // Preencher os outros itens através da pesquisa da string "Mês referência PBC"
      First;
      // Achar a 1a. string "Mês referência PBC"
      while not Eof do
      begin
         sDescricao := UpperCase(FieldByName('DESCRICAO').AsString);
         if Pos('MES REFERENCIA PBC', sDescricao) > 0
         then break;
         Next;
      end;

      iContParada := 0;
      while not Eof do
      begin
         sDescricao := UpperCase(FieldByName('DESCRICAO').AsString);
         if Pos('MES REFERENCIA PBC', sDescricao) > 0
         then begin
            sMesAno := Copy(FieldbyName('VALOR').AsString,6,2)+'/'+Copy(FieldbyName('VALOR').AsString,1,4);
            Next;
            continue;
         end;

         // Parar loop quando chegar no último mês e encontrar a 2a descricao 'código de cargo'
         if (sMesAno = Copy(sMenorAnoMes,6,2)+'/'+Copy(sMenorAnoMes,1,4)) and
            (Pos('DIGO DO CARGO', sDescricao) > 0)
         then begin
            inc(iContParada);
            if iContParada >= 2 then break
         end;

         // Verificar o tipo de dado e preencher o grupo/coluna correspondentes
         if (Pos('ATS', sDescricao) > 0)  and (Pos('%', sDescricao) <= 0)
         then AtualizaTabelaValoresPBC ( sMesAno, 1, 3, FieldbyName('VALOR').AsString)
         else if (Pos('VP', sDescricao) > 0)
         then AtualizaTabelaValoresPBC ( sMesAno, 1, 4, FieldbyName('VALOR').AsString)
         else if (Pos('NOTURNO', sDescricao) > 0)
         then AtualizaTabelaValoresPBC ( sMesAno, 2, 1, FieldbyName('VALOR').AsString)
         else if (Pos('INSALUB', sDescricao) > 0)
         then AtualizaTabelaValoresPBC ( sMesAno, 2, 2, FieldbyName('VALOR').AsString)
         else if (Pos('PERICUL', sDescricao) > 0)
         then AtualizaTabelaValoresPBC ( sMesAno, 2, 3, FieldbyName('VALOR').AsString)
         else if (Pos('COMPENS', sDescricao) > 0)
         then AtualizaTabelaValoresPBC ( sMesAno, 3, 1, FieldbyName('VALOR').AsString)
         else if (Pos('VAN', sDescricao) > 0)  and (Pos('BNH', sDescricao) > 0)
         then AtualizaTabelaValoresPBC ( sMesAno, 3, 2, FieldbyName('VALOR').AsString)
         else if (Pos('COMP', sDescricao) > 0)  and (Pos('BNH', sDescricao) > 0)
         then AtualizaTabelaValoresPBC ( sMesAno, 3, 3, FieldbyName('VALOR').AsString)
         else if (Pos('HORAS', sDescricao) > 0)  and (Pos('BNH', sDescricao) > 0)
         then AtualizaTabelaValoresPBC ( sMesAno, 3, 4, FieldbyName('VALOR').AsString);

         Next;
      end;
   end; // with qryAux

   inherited;
end;

procedure TfrmPRelEnquadramento.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

end.
