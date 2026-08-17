unit FAtPlanoPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, ComCtrls, Db,
  DBTables, Wwquery, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc,  Mask, wwdbedit, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmAtPlanoPrev = class(TfrmOkCancelar)
    ds: TwwDataSource;
    qryAux: TwwQuery;
    Panel2: TPanel;
    qryAtual: TwwQuery;
    qry: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    DsAtual: TwwDataSource;
    LbTitulo: TLabel;
    LbTotal: TLabel;
    qryAtualIDPESSOA: TFloatField;
    qryAtualNOME: TStringField;
    qryAtualPATROCINADORA: TStringField;
    qryAtualIDPLANOPREV: TFloatField;
    qryAtualIDPESSJUR: TFloatField;
    qryAtualSEQPROPOSTA: TFloatField;
    qryAtualIDPLANASS: TFloatField;
    qryAtualIDSITPART: TFloatField;
    qryAtualDATAENTRADA: TDateTimeField;
    qryAtualFLGPARTBENEF: TStringField;
    qryAtualFLGINSCRICAOCANC: TFloatField;
    qryAtualIDNUCLEO: TFloatField;
    qryAtualOPCAOB: TStringField;
    qryAtualOPCAOA: TStringField;
    qryAtualINSCRICAONUMERO: TStringField;
    qryAtualIDDEPENDENTE: TFloatField;
    qryAtualRESPONSAVELPAG: TFloatField;
    qryAtualIDCONTASS: TFloatField;
    qryAtualRECPAG: TStringField;
    qryAtualCODPORTFORMA: TFloatField;
    qryAtualFLGCOBCARNE: TFloatField;
    qryAtualIDPAGADOR: TFloatField;
    qryAtualFLAGATIVO: TFloatField;
    qryAtualSITUACAOPREV: TStringField;
    qryDesativadoPrev: TwwQuery;
    qrySincroniza: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sIdPlanoPrev, sIdPessjur,
    sDataEntrada: String;
    Function VerifCmp(St:String): String;
    Function Insere: Boolean;
    Function Atualiza(cTipo:Char): Boolean;
    Procedure AbreQry(Md:Char);
  public
    { Public declarations }
  end;

var
  frmAtPlanoPrev: TfrmAtPlanoPrev;

implementation

uses UMensErro, Message, DBaseDados, UDataBase;

{$R *.DFM}

Function TfrmAtPlanoPrev.VerifCmp(St:String): String;
Var Ch    : Char;
    A, Tam: Integer;
    StAux : String;
begin
  StAux:='';
  Tam:=Length(St);
  For A:=1 to Tam do
  begin
    Ch:=St[A];
    If UpCase(Ch) In ['A'..'Z','0'..'9','.',','] then StAux:=StAux+Ch;
  end;
  If StAux='' then StAux:='NULL';
  Result:=StAux;
end;

Function TfrmAtPlanoPrev.Insere: Boolean;
Var sSql: String;
begin
  Result:=True;
  sIdPlanoPrev := '';
  sIdPessjur := '';
  With qryAux do
  begin
    Close;
    (* Procura o Plano Previdenciário que está ativo *)
    sSql:='SELECT DISTINCT PP.IDPLANOPREV, PP.IDPESSJUR '+
          ' FROM PARTPREVPLAN PP, PARTASS PT'+
          ' WHERE'+
          ' (PP.FLGDESATIVADO=0) AND'+
          ' (PP.IDPESSOA=PT.IDPESSOA) AND'+
          ' (PT.IDPESSOA='+qryAtual.FieldByName('IDPESSOA').AsString+')';
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    If Not IsEmpty then
    begin
      sIdPlanoPrev := FieldByName('IDPLANOPREV').AsString;
      sIdPessjur   := FieldByName('IDPESSJUR').AsString;
    end;
  end; {With}

  If sIdPlanoPrev<>'' then
  begin
    sDataEntrada:=qryAtual.FieldByName('DATAENTRADA').AsString;

    (* PARTASS *)
    sSql:='INSERT INTO PARTASS       '+
          '  (IDPESSJUR,             '+
          '   SEQPROPOSTA,           '+
          '   IDPLANOPREV,           '+
          '   IDPESSOA,              '+
          '   IDPLANASS,             '+
          '   IDSITPART,             '+
          '   DATAENTRADA,           '+
          '   FLGPARTBENEF,          '+
          '   FLGINSCRICAOCANC,      '+
          '   IDNUCLEO,              '+
          '   OPCAOB,                '+
          '   OPCAOA,                '+
          '   INSCRICAONUMERO)       '+
          '   VALUES (               '+
          sIdPessjur + ','+
//          qryAtual.FieldByName('IDPESSJUR').AsString+','+
          qryAtual.FieldByName('SEQPROPOSTA').AsString+','+
          sIdPlanoPrev+','+
          qryAtual.FieldByName('IDPESSOA').AsString+','+
          qryAtual.FieldByName('IDPLANASS').AsString+','+
          VerifCmp(qryAtual.FieldByName('IDSITPART').AsString)+','+
          'TO_DATE('+QuotedStr(sDataEntrada)+','+QuotedStr('DD/MM/YYYY')+'),'+
          QuotedStr(qryAtual.FieldByName('FLGPARTBENEF').AsString)+','+
          VerifCmp(qryAtual.FieldByName('FLGINSCRICAOCANC').AsString)+','+
          VerifCmp(qryAtual.FieldByName('IDNUCLEO').AsString)+','+
          QuotedStr(qryAtual.FieldByName('OPCAOB').AsString)+','+
          QuotedStr(qryAtual.FieldByName('OPCAOA').AsString)+','+
          QuotedStr(qryAtual.FieldByName('INSCRICAONUMERO').AsString)+')';
    With qryAux do
    begin
      Close;
      Sql.Clear;
      Sql.Add(sSql);
      try
        ExecSQL;
      except
      on E:EDBEngineError do
           begin
             MsgDlg('Erro na atualização do participante.','Erro',mtError,[mbOk,mbHelp],0);
             dtmBaseDados.dbBaseDados.RollBack;
             Result:=False;
             Exit;
           end;
      end;
    end; {With}

    (* BENEFASS *)
    sSql:='INSERT INTO BENEFASS (    '+
          'IDTITULAR,                '+
          'IDPESSJUR,                '+
          'IDPLANOPREV,              '+
          'IDPLANASS,                '+
          'IDDEPENDENTE,             '+
          'DATAENTRADA,              '+
          'SEQPROPOSTA,              '+
          'FLGATIVO,                 '+
          'RESPONSAVELPAG)           '+
          'VALUES (                  '+
          qryAtual.FieldByName('IDPESSOA').AsString+','+
//          qryAtual.FieldByName('IDPESSJUR').AsString+','+
          sIdPessjur + ','+
          sIdPlanoPrev+','+
          qryAtual.FieldByName('IDPLANASS').AsString+','+
          qryAtual.FieldByName('IDDEPENDENTE').AsString+','+
         'TO_DATE('+QuotedStr(sDataEntrada)+','+QuotedStr('DD/MM/YYYY')+'),'+
          qryAtual.FieldByName('SEQPROPOSTA').AsString+','+
          VerifCmp(qryAtual.FieldByName('FLAGATIVO').AsString)+','+
          qryAtual.FieldByName('RESPONSAVELPAG').AsString+')';

    With qryAux do
    begin
      Close;
      Sql.Clear;
      Sql.Add(sSql);
      try
        ExecSQL;
      except
        on E:EDBEngineError do
           begin
             MsgDlg('Erro na atualização do participante.','Erro',mtError,[mbOk,mbHelp],0);
             dtmBaseDados.dbBaseDados.RollBack;
             Result:=False;
             Exit;
           end;
      end;
    end; {With}

    (* CONTASS *)
    sSql := 'INSERT INTO CONTASS                '+
            ' (IDPLANASS,                       '+
            '  IDTITULAR,                       '+
            '  IDDEPENDENTE,                    '+
            '  IDPLANOPREV,                     '+
            '  IDPESSJUR,                       '+
            '  IDCONTASS,                       '+
            '  FLGATIVO,                        '+
            '  RECPAG,                          '+
            '  CODPORTFORMA,                    '+
            '  FLGCOBCARNE,                     '+
            '  IDPAGADOR,                       '+
            '  SEQPROPOSTA)                     '+
            'VALUES      (                      '+
            qryAtual.FieldByName('IDPLANASS').AsString+','+
            qryAtual.FieldByName('IDPESSOA').AsString+','+
            qryAtual.FieldByName('IDDEPENDENTE').AsString+','+
            sIdPlanoPrev+','+
//            qryAtual.FieldByName('IDPESSJUR').AsString+','+
            sIdPessjur + ','+
            qryAtual.FieldByName('IDCONTASS').AsString+','+
            VerifCmp(qryAtual.FieldByName('FLAGATIVO').AsString)+','+
            QuotedStr(qryAtual.FieldByName('RECPAG').AsString)+','+
            VerifCmp(qryAtual.FieldByName('CODPORTFORMA').AsString)+','+
            VerifCmp(qryAtual.FieldByName('FLGCOBCARNE').AsString)+','+
            VerifCmp(qryAtual.FieldByName('IDPAGADOR').AsString)+','+
            qryAtual.FieldByName('SEQPROPOSTA').AsString+')';
    With qryAux do
    begin
      Close;
      Sql.Clear;
      Sql.Add(sSql);
      try
        qryAux.ExecSQL;
      except
      on E:EDBEngineError do
           begin
             MsgDlg('Erro na atualização do participante.','Erro',mtError,[mbOk,mbHelp],0);
             dtmBaseDados.dbBaseDados.RollBack;
             Result:=False;
             Exit;
           end;
      end;
    end; {With}
  end;
end;

Function TfrmAtPlanoPrev.Atualiza(cTipo:Char): Boolean;
Var sObs, sData: String;
begin
  sObs:='';
  sData:='NULL';
  Result:=True;
  If cTipo<>'1' then cTipo:='0';
  Case cTipo Of
    '1': begin
           sObs:='#==CANCELADO==# '+qryAtual.FieldByName('SITUACAOPREV').AsString;
           sData:='TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY'')';
         end;
  end; {Case}
  (* PARTASS *)
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
   ('UPDATE PARTASS'+
    ' SET FLGINSCRICAOCANC = '+cTipo+','+
    ' DATACANCELAMENTO = '+sData+','+
    ' OBSCANCEL = '+QuotedStr(sObs)+
    ' WHERE (IDPESSOA = '+qryAtual.FieldByName('IDPESSOA').AsString+')'+
    ' AND (IDPESSJUR = '+qryAtual.FieldByName('IDPESSJUR').AsString+')'+
    ' AND (IDPLANOPREV = '+qryAtual.FieldByName('IDPLANOPREV').AsString+')'+
    ' AND (IDPLANASS  = '+qryAtual.FieldByName('IDPLANASS').AsString+')');
  try
    qryAux.ExecSQL;
  except
    on E:EDBEngineError do
         begin
           MsgDlg('Erro na atualização do participante.','Erro',mtError,[mbOk,mbHelp],0);
           dtmBaseDados.dbBaseDados.RollBack;
           Result:=False;
           Exit;
         end;
  end;
   (* Se cTipo=´1´ - Indica que está cancelando, então cTipo=´0´ *)
   (* que vai se tornar o FlgAtivo *)
   (* Se cTipo = '1' então FlgAtivo = 0 - Cancelado *)
   If cTipo='1' then cTipo:='0'
   else cTipo:='1';

  (* BENEFASS *)
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
   ('UPDATE BENEFASS'+
    ' SET FLGATIVO = '+cTipo+','+
    ' DTCANCELAMENTO = '+sData+','+
    ' OBSCANCEL = '+QuotedStr(sObs)+
    ' WHERE (IDTITULAR = '+qryAtual.FieldByName('IDPESSOA').AsString+')'+
    ' AND (IDPESSJUR = '+qryAtual.FieldByName('IDPESSJUR').AsString+')'+
    ' AND (IDPLANOPREV = '+qryAtual.FieldByName('IDPLANOPREV').AsString+')'+
    ' AND (IDPLANASS  = '+qryAtual.FieldByName('IDPLANASS').AsString+')');
  try
    qryAux.ExecSQL;
  except
    on E:EDBEngineError do
    begin
      MsgDlg('Erro ao cancelar o dependente do participante.', 'Erro', mtError,
             [mbOk,mbHelp], 0);
      dtmBaseDados.dbBaseDados.RollBack;
      Result:=False;
      exit;
    end;
  end;

  (* CONTASS *)
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
    ('UPDATE CONTASS'+
     ' SET FLGATIVO = '+cTipo+
     ' WHERE (IDTITULAR = '+qryAtual.FieldByName('IDPESSOA').AsString+')'+
     ' AND (IDPESSJUR = '+qryAtual.FieldByName('IDPESSJUR').AsString+')'+
     ' AND (IDPLANOPREV = '+qryAtual.FieldByName('IDPLANOPREV').AsString+')'+
     ' AND (IDPLANASS ='+qryAtual.FieldByName('IDPLANASS').AsString+')');
  try
    qryAux.ExecSQL;
  except
    on E:EDBEngineError do
    begin
      MsgDlg('Erro ao cancelar o participante.','Erro',mtError,[mbOk,mbHelp],0);
      dtmBaseDados.dbBaseDados.RollBack;
      Result:=False;
      exit;
    end;
  end;
end;

Procedure TfrmAtPlanoPrev.AbreQry(Md:Char);
Var sSql: String;
begin
  sSql:=
   'SELECT  P.NOME, PJ.NOME AS PATROCINADORA,'+#13#10+
   (* PARTASS *)
   ' PT.IDPESSJUR, PT.SEQPROPOSTA,'+#13#10+
   ' PT.IDPLANOPREV, PT.IDPESSOA,'+#13#10+
   ' PT.IDPLANASS, PT.IDSITPART,'+#13#10+
   ' PT.DATAENTRADA, PT.FLGPARTBENEF,'+#13#10+
   ' PT.FLGINSCRICAOCANC, PT.IDNUCLEO,'+#13#10+
   ' PT.OPCAOB, PT.OPCAOA, PT.INSCRICAONUMERO,'+#13#10+
   ' ST.DESCRICAO AS SITUACAOPREV,'+#13#10+

   (* BENEFASS *)
   ' BF.IDDEPENDENTE,'+#13#10+
   ' BF.RESPONSAVELPAG,'+#13#10+

   (* CONTASS *)
   ' CT.IDCONTASS, CT.FLGATIVO AS FLAGATIVO, CT.RECPAG, CT.CODPORTFORMA,'+#13#10+
   ' CT.FLGCOBCARNE, CT.IDPAGADOR'+#13#10+

   ' FROM PARTPREVPLAN PP,'+#13#10+
   '    PESSOA P,'+#13#10+
   '    PESSOA PJ,'+#13#10+
   '    PLANPREV PN,'+#13#10+
   '    PARTASS PT,'+#13#10+
   '    BENEFASS BF,'+#13#10+
   '    CONTASS CT,'+#13#10+
   '    SITPLANOPREV ST'+#13#10+
   ' WHERE'+#13#10;
  If Md='0' then
    sSql:=sSql+' (PP.FLGDESATIVADO=0) AND'+#13#10
  else
    sSql:=sSql+' (PP.FLGDESATIVADO=1) AND'+#13#10;
  sSql:=sSql+
   ' (PP.IDPESSOA=PT.IDPESSOA) AND '+#13#10+
   ' (PP.IDPESSOA=P.IDPESSOA) AND '+#13#10+
   ' (PP.IDPESSJUR=PJ.IDPESSOA) AND '+#13#10+
   ' (PP.IDPLANOPREV=PN.IDPLANOPREV) AND '+#13#10+
   ' (PP.IDPLANOPREV=PT.IDPLANOPREV) AND '+#13#10+
   ' (PP.IDSITPLANOPREV=ST.IDSITPLANOPREV) AND'+#13#10+

   ' (PP.IDPESSJUR = BF.IDPESSJUR) AND '+#13#10+ // TAVARES 12/03/2003 para evitar um full access
   ' (PT.IDPESSOA=BF.IDTITULAR) AND '+#13#10+
   ' (PT.IDPLANOPREV=BF.IDPLANOPREV) AND '+#13#10+
   ' (PT.IDPLANASS=BF.IDPLANASS) AND '+#13#10+

   ' (PT.IDPESSOA=CT.IDTITULAR) AND '+#13#10+
   ' (PT.IDPLANOPREV=CT.IDPLANOPREV) AND '+#13#10+
   ' (PT.IDPLANASS=CT.IDPLANASS) AND '+#13#10;

  If Md='0' then
   sSql:=sSql+' (PT.FLGINSCRICAOCANC=1) AND '+#13#10+
              ' (PT.DATACANCELAMENTO IS NOT NULL) AND'+#13#10+
              ' (PT.OBSCANCEL LIKE '+QuotedStr('#==CANCELADO==#%')+')'
  else
   sSql:=sSql+' (PT.FLGINSCRICAOCANC=0) AND'+#13#10+
              ' (PT.DATACANCELAMENTO IS NULL)';

 sSql:=sSql+#13#10+' ORDER BY PATROCINADORA, NOME';
 qryAtual.Close;
 qryAtual.Sql.Clear;
 qryAtual.Sql.Add(sSql);
 qryAtual.Open;
 qryAtual.First;
end;

procedure TfrmAtPlanoPrev.bbtnConfirmarClick(Sender: TObject);
var contador : integer;
begin

  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;
  (* DesFaz o Cancelamento de Todos os Registros da qryAtual *)

//início - andré Tavares - pendência 15108 - sincroniza o assistencial com o previdenciário
//      se está desativado no plano previdenciário, então será cancelado no plano assistencial corrrespondente
      qrySincroniza.close;
      qrySincroniza.sql.Text := ' UPDATE PARTASS PT SET PT.FLGINSCRICAOCANC = 1  WHERE  '+
                                '  EXISTS (SELECT * FROM PARTPREVPLAN PPP               '+
                                '          WHERE PPP.IDPESSOA = PT.IDPESSOA AND         '+
                                '                PPP.FLGDESATIVADO = 1 AND              '+
                                '                PT.FLGINSCRICAOCANC = 0 AND            '+
                                '                PPP.IDPESSJUR = PT.IDPESSJUR AND       '+
                                '                PPP.SEQPROPOSTA = PT.SEQPROPOSTA AND   '+
                                '                PPP.IDPLANOPREV = PT.IDPLANOPREV)      ';

      qrySincroniza.execSql;

      qrySincroniza.close;
      qrySincroniza.sql.Text := ' UPDATE CONTASS CT SET                                 '+
                                ' CT.FLGATIVO = 0 WHERE                                 '+
                                ' EXISTS (SELECT * FROM PARTPREVPLAN PPP                '+
                                '         WHERE PPP.IDPESSOA = CT.IDTITULAR AND         '+
                                '               PPP.FLGDESATIVADO = 1 AND               '+
                                '               CT.FLGATIVO = 1 AND                     '+
                                '               PPP.IDPESSJUR = CT.IDPESSJUR AND        '+
                                '               PPP.SEQPROPOSTA = CT.SEQPROPOSTA AND    '+
                                '               PPP.IDPLANOPREV = CT.IDPLANOPREV)       ';
      qrySincroniza.execSql;

      qrySincroniza.close;
      qrySincroniza.sql.Text := ' UPDATE BENEFASS BF SET                                '+
                                ' BF.FLGATIVO = 0                                       '+
                                '  WHERE                                                '+
                                '  EXISTS (SELECT * FROM PARTPREVPLAN PPP               '+
                                '          WHERE PPP.IDPESSOA = BF.IDTITULAR AND        '+
                                '                PPP.FLGDESATIVADO = 1 AND              '+
                                '                BF.FLGATIVO = 1 AND                    '+
                                '                PPP.IDPESSJUR = BF.IDPESSJUR AND       '+
                                '                PPP.SEQPROPOSTA = BF.SEQPROPOSTA AND   '+
                                '                PPP.IDPLANOPREV = BF.IDPLANOPREV)      ';
      qrySincroniza.execSql;
//fim - andré Tavares - pendência 15108 - sincroniza o assistencial com o previdenciário



  AbreQry('0');
  LbTitulo.Caption:='PARTICIPANTES COM PLANO PREVIDENCIÁRIO ATIVO';
  If Not qryAtual.IsEmpty then
  Repeat
   (* '0' = Reverte Cancelamento *)
   If Not Atualiza('0') then Abort;
   qryAtual.Next;
  Until(qryAtual.Eof);

  AbreQry('1');
  LbTitulo.Caption:='PARTICIPANTES COM PLANO PREVIDENCIÁRIO CANCELADO';
  contador := 0;
  (* Faz a Inclusao de Todos os Registros da qryAtual *)
  If Not qryAtual.IsEmpty then
  begin
    Repeat
      (* Inclusão *)
      // inicio tavares 08/04/2002
      qryDesativadoPrev.Close;
      qryDesativadoPrev.sql.Text := ' select distinct idplanoprev, idpessjur, '+
                                ' flgdesativado from partprevplan where idpessoa = '
                                + qryAtual.FieldByName('IDPESSOA').AsString + ' and flgdesativado = 1 ' ;
      qryDesativadoPrev.Open;
      contador := 0;
      if (qryDesativadoPrev.recordCount >= 1) and (contador < 1) then
      begin
        If Not Insere then Abort;
        contador := contador + 1;
        qryAtual.Next;
      end;
      // fim tavares 08/04/2002

      qryAtual.Next;
    Until(qryAtual.Eof);
    qryAtual.First;
    (* Faz o Cancelamento de Todos os Registros da qryAtual *)
    Repeat
      (* '1' = Cancelamento *)
      If Not Atualiza('1') then Abort;
      qryAtual.Next;
    Until(qryAtual.Eof);
  end;
  dtmBaseDados.dbBaseDados.Commit;
  qryAtual.Close;
  qryAtual.Open;
  LbTotal.Caption:='Total: '+IntToStr(qryAtual.RecordCount);

end;

procedure TfrmAtPlanoPrev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryAtual.Close;
  Action := caFree;
end;

procedure TfrmAtPlanoPrev.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAtPlanoPrev.FormCreate(Sender: TObject);
begin
  inherited;
  qryAtual.Open;
  LbTotal.Caption:='Total: '+IntToStr(qryAtual.RecordCount);
end;

end.
