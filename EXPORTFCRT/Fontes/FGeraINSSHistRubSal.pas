unit FGeraINSSHistRubSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, ComCtrls;

type
  TfrmGeraINSSHistRubSal = class(TfrmOkCancelar)
    Label1: TLabel;
    edAnoMesRef: TEdit;
    Label2: TLabel;
    lblProcesso: TLabel;
    Label3: TLabel;
    edCodRubricaNormal: TEdit;
    Label4: TLabel;
    edCodRubricaAtraso: TEdit;
    edCodRubricaDevolucao: TEdit;
    Label5: TLabel;
    qry: TwwQuery;
    qryGrava: TwwQuery;
    PbProcesso: TProgressBar;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraINSSHistRubSal: TfrmGeraINSSHistRubSal;

implementation

uses DBaseDados, UAdmPREV, UMensErro;

{$R *.DFM}

procedure TfrmGeraINSSHistRubSal.bbtnConfirmarClick(Sender: TObject);
var sSQL : string;
    sIdRubrica : string;
    sCodProvDesc : string;
    i , iTotal, iLidos, iProcessados : LongInt;
    sAnoMesInicio, sAnoMesAtual,
    sAnoMesFinal : string;
begin
  inherited;
  with qry do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT H.MES, H.MESREFERENCIA, H.VALORINTEGRAL, H.VLBENEFPGTO, '+
             '        H.IDPESSJUR, H.IDPLANOPREV, H.IDPESSOA, H.IDTITULAR,    '+
             '        H.IDMOTIVO, H.SEQPROPOSTA, H.FLGDEVOLUCAO,H.DATAPAGAMENTO,'+
             '        H.NUMEROPROCESSO           '+
             ' FROM   HSTBENEFBFCIARIO H, BENEFPLANPREV BP                    '+
             ' WHERE  H.MES = '''+edAnoMesRef.Text+'''                        '+
             ' AND    BP.IDPLANOPREV = H.IDPLANOPREV                          '+
             ' AND    BP.IDBENEFICIO = H.IDBENEFICIO                          '+
             ' AND    BP.FLGREFERENCIA = 1                                    '+
//             ' AND    H.FLGDEVOLUCAO = 1 '+
//             ' AND    H.IDPESSOA = 1 '+
             ' ORDER BY H.IDPESSOA, H.MESREFERENCIA                           ');
     Open;
  end;

  iTotal := qry.RecordCount;
  i      := 0; iLidos := 0; iProcessados := 0;
  qry.First;
  PbProcesso.Max  := iTotal;
  PbProcesso.Step := 1;

  sAnoMesInicio := '2002/01';
  sAnoMesFinal  := '2003/01';
  sAnoMesAtual  := sAnoMesInicio;
  while sAnoMesAtual <= sAnoMesFinal do
  begin
     dtmBaseDados.dbBaseDados.StartTransaction;
     while not qry.Eof do
     begin
        if qry.FieldByName('FLGDEVOLUCAO').AsInteger = 1 then begin
           { Augusto 27/06/2003 - Retirado a pedido da Claudia Uhr, não gerar este código }
           qry.Next;
           continue;
           { * }

          sIdRubrica := OraNumero(edCodRubricaDevolucao.Text);

        end else if qry.FieldByName('MESREFERENCIA').AsString < qry.FieldByName('MES').AsString then
          sIdRubrica := OraNumero(edCodRubricaAtraso.Text)
        else
          sIdRubrica := OraNumero(edCodRubricaNormal.Text);

        // Buscar codprovdesc
        qryGrava.Close;
        qryGrava.SQL.Clear;
        qryGrava.SQL.Add(' SELECT CODPROVDESC FROM PROVDESC '+
                         ' WHERE  IDPROVENTO   = '+sIdRubrica );
        qryGrava.Open;

        if (not qryGrava.IsEmpty) and (qryGrava.FieldByName('CODPROVDESC').AsString <> '')
        then sCodProvDesc := qryGrava.FieldByName('CODPROVDESC').AsString
        else sCodProvDesc := sIdRubrica;

        // Verificar se rubrica já existe
        qryGrava.Close;
        qryGrava.SQL.Clear;
        qryGrava.SQL.Add(' SELECT /*+ RULE */ H.VALORPROVENTO '+
                         ' FROM   HISTRUBSAL H            '+
                         ' WHERE  (H.IDPESSOA    = '+qry.FieldByName('IDPESSOA').AsString        +'  ) '+
                         ' AND    (H.MES         = '''+qry.FieldByName('MESREFERENCIA').AsString +''') '+
                         ' AND    (H.MESCOBRANCA = '''+qry.FieldByName('MES').AsString           +''') '+
                         ' AND    (H.IDRUBRICA   = '+sIdRubrica                                  +'  ) '+
                         ' AND    (H.IDPATRO     = '+qry.FieldByName('IDPESSJUR').AsString        +' ) ');
        qryGrava.Open;

        Inc(iLidos);
        PbProcesso.StepIt;

        if not qryGrava.IsEmpty
        then begin
           qry.Next;
           continue;
        end;

        sSQL := ' INSERT INTO HISTRUBSAL ( MESCOBRANCA,         MES,               IDMOTIVO,            '+
                '                          IDPESSOA,            IDPESSJUR,         IDPATRO,             '+
                '                          IDPLANOPREV,         IDRESPONSAVEL,     IDTITULAR,           '+
                '                          IDFAVORECIDO,        NUMEROPROCESSO,    SEQRUBRICA,          '+
                '                          REFERENCIA,          IDRUBRICA,         VALORPROVENTO,       '+
                '                          VALORINTEGRAL,       FLGSALFAM,         FLGIRRFTOTAL,        '+
                '                          FLGMOLESTIAGRAVE,    FLGISENTOIRRF,     NUMDEPIRRF,          '+
                '                          NUMDEPSF,            CODPROVDESC,       IDINFORME,           '+
                '                          CODPORTFORMA,        CODIRRFDARF,       CODDOCUMENTO,        '+
                '                          CODMOEDA,            IDHSTFOLHABENEF,   IDLANCIRRF,          '+
                '                          IDRETROATIVO,        IDREGRACALCULO,    FLGCOMPOESALPART,    '+
                '                          FLGCOMPOESALBENEF,   FLGIRRF,           VALORCOTAS,          '+
                '                          VLRANTRETROATIVO,    FLGCOMPOEREMTOTAL, FLGPREVIA,           '+
                '                          FLGSRB,FLGCONCESSAO, FONTEPAGADORA,     IDLANCIRRFESTORNO,   '+
                '                          DATAPAGAMENTO,       FLGSALPARTRETRO,   FLGSALPARTATUARIA,   '+
                '                          FLGSALBENEFRETRO,    IDMODULO,          VALORINFO,           '+
                '                          VALORNADIB,          TIPOITEMPCS,       SEQHISTFUNC,         '+
                '                          FLGEQUIPARACAO,      PERCENTUALNADIB,   VALORRECEBIDO,       '+
                '                          FLGPENSAOALIM,       NUMBANCO,          NUMAGENCIA,          '+
                '                          CONTACORRENTE,       FLGESTORNO,        IDVERSAOPAGTO        '+
                '                        )                                                              '+
                ' VALUES                 ( '''+qry.FieldByName('MES').AsString+''',                     '+
                '                          '''+qry.FieldByName('MESREFERENCIA').AsString+''',           '+
                                               qry.FieldByName('IDMOTIVO').AsString+',                  '+
                                               qry.FieldByName('IDPESSOA').AsString+',                  '+
                                               '1,                                                      '+
                                               qry.FieldByName('IDPESSJUR').AsString+',                 '+
                                               qry.FieldByName('IDPLANOPREV').AsString+',               '+
                                               qry.FieldByName('IDPESSOA').AsString+',                  '+
                                               qry.FieldByName('IDTITULAR').AsString+',                 '+
                                               qry.FieldByName('IDPESSOA').AsString+',                  '+
                                               qry.FieldByName('NUMEROPROCESSO').AsString+',            '+
                                               '1,                                                      '+
                                               '''***'',                                                '+
                                               sIdRubrica+',                                            ';

        sSQL := sSQL + OraNumero(qry.FieldByName('VLBENEFPGTO').AsString)+',                      '+
                         OraNumero(qry.FieldByName('VALORINTEGRAL').AsString)+',                  '+
                         '0,0,0,0,0,0,                                                            '+
                         ''''+sCodProvDesc+''',                                                   '+
                         'NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,                         '+
                         '0,0,0,0,0,0,0,0,NULL,NULL,                                              '+
                         'TO_DATE('''+qry.FieldByName('DATAPAGAMENTO').AsString+''',''DD/MM/YYYY''), '+
                         '0,0,0,598,                                                              '+
                         OraNumero(qry.FieldByName('VALORINTEGRAL').AsString)+',                  '+
                         OraNumero(qry.FieldByName('VALORINTEGRAL').AsString)+',                  '+
                         'NULL,1,0,0,                                                             '+
                         OraNumero(qry.FieldByName('VALORINTEGRAL').AsString)+',                  '+
                         '0,NULL,NULL,NULL,0,NULL)                                                ';
        qryGrava.Close;
        qryGrava.SQL.Clear;
        qryGrava.SQL.Add(sSQL);
        try
           qryGrava.ExecSQL;
        except
   //        dtmBaseDados.dbBaseDados.RollBack;
   //        MsgDlg('Erro no Processamento. Processo Abortado.','Erro',mtError,[mbOK],0);
   //        Exit;
           dec(i);
        end;

        Inc(iProcessados);
        inc(i);
        //lblProcesso.Caption := 'Mês : '+sAnoMesAtual+' - Linhas Processadas : '+IntToStr(i) +' de '+IntToStr(iTotal);
        lblProcesso.Caption := 'Linhas Lidas '+IntToStr(iLidos)+' Processadas : '+IntToStr(iProcessados)+' de '+IntToStr(iTotal);
        Application.ProcessMessages;
        qry.Next;
     end;

     dtmBaseDados.dbBaseDados.Commit;
     sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual,6,2)),StrToInt(Copy(sAnoMesAtual,1,4)));
  end;

  lblProcesso.Caption := 'Linhas Lidas '+IntToStr(iLidos)+' Processadas : '+IntToStr(iProcessados)+' de '+IntToStr(iTotal);
  MsgDlg('Processo Terminado com Sucesso !!!','Informação',mtInformation,[mbOK],0);
end;

end.
