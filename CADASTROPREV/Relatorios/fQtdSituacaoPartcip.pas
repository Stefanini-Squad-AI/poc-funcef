unit fQtdSituacaoPartcip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,              
  wwdbdatetimepicker, CMDateTimePicker, Db, DBTables, Wwquery;

type
  TfrmQtdSituacaoPartcip = class(TfrmParamReports_Padrao)
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDataInicial: TCMDateTimePicker;
    edtDataFinal: TCMDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ListBoxSit: TListBox;
    ListBoxSitParam: TListBox;
    qryAux: TwwQuery;
    dsAux: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sSit :string;
  end;

var
  frmQtdSituacaoPartcip: TfrmQtdSituacaoPartcip;

implementation

uses
  dQtdSituacaoPartcip, UMensErro;

{$R *.DFM}



procedure TfrmQtdSituacaoPartcip.FormCreate(Sender: TObject);
var
i :integer;
begin
  inherited;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('  SELECT DISTINCT DECODE(FLGINTERNO,        ');
  qryAux.SQL.Add('                    ''AS'',                 ');
  qryAux.SQL.Add('                    ''ASSISTIDO'',          ');
  qryAux.SQL.Add('                    ''AT'',                 ');
  qryAux.SQL.Add('                    ''ATIVO'',              ');
  qryAux.SQL.Add('                    ''CA'',                 ');
  qryAux.SQL.Add('                    ''CANCELADO'',          ');
  qryAux.SQL.Add('                    ''MA'',                 ');
  qryAux.SQL.Add('                    ''AUTOPATROCINADO'',            ');
  qryAux.SQL.Add('                    ''MP'',                 ');
  qryAux.SQL.Add('                    ''AUTOPATROCINADO PARCIAL'',    ');
  qryAux.SQL.Add('                    ''MS'',                  ');
  qryAux.SQL.Add('                    ''BPD'') as descricao ');
  qryAux.SQL.Add('                 FROM SITPART                ');
  qryAux.Open;

  For i := 0 to (qryAux.RecordCount)-1 Do Begin
  ListBoxSit.Items.Add(qryAux.FieldByName('descricao').asString);
  qryAux.Next;
  End;

end;

procedure TfrmQtdSituacaoPartcip.BitBtn1Click(Sender: TObject);
var
i,si : integer;
begin
  inherited;
  si := -1;
  if ListBoxSit.Items.Count > 0 then begin
    for i := 0 to (ListBoxSit.Items.Count)-1 do begin
      if ListBoxSit.Selected[i] then
      si := i
    end;
    If si = -1 then begin
      ShowMessage('Selecione uma situação.');
      exit;
    end else begin
      ListBoxSitParam.Items.Add(ListBoxSit.Items.Strings[si]);
      ListBoxSit.Items.Delete(si);
    end;
  end;
end;

procedure TfrmQtdSituacaoPartcip.BitBtn2Click(Sender: TObject);
var
i,si : integer;
begin
  inherited;
  si := -1;
  if ListBoxSitParam.Items.Count > 0 then begin
    For i := 0 to (ListBoxSitParam.Items.Count)-1 Do Begin
      if ListBoxSitParam.Selected[i] then
      si := i
    End;
    If si = -1 then begin
      ShowMessage('Selecione uma situação.');
      exit;
    end else begin
      ListBoxSit.Items.Add(ListBoxSitParam.Items.Strings[si]);
      ListBoxSitParam.Items.Delete(si);
    end;
  end;
end;

procedure TfrmQtdSituacaoPartcip.BitBtn3Click(Sender: TObject);
var
i : integer;
begin
  inherited;
  If ListBoxSit.Items.Count > 0 then begin
    For i := 0 to (ListBoxSit.Items.Count)-1 Do Begin
    ListBoxSitParam.Items.Add(ListBoxSit.Items.Strings[i]);
    End;
    ListBoxSit.Items.Clear;
  End;
end;

procedure TfrmQtdSituacaoPartcip.BitBtn4Click(Sender: TObject);
var
i : integer;
begin
  inherited;
  if ListBoxSitParam.Items.Count > 0 then begin
    For i := 0 to (ListBoxSitParam.Items.Count)-1 Do Begin
    ListBoxSit.Items.Add(ListBoxSitParam.Items.Strings[i]);
    End;
    ListBoxSitParam.Items.Clear;
  End;
end;


procedure TfrmQtdSituacaoPartcip.bbtnConfirmarClick(Sender: TObject);
var
   pFlgInterno : TStringList;
   pFlgInternoSql : String;
   i : integer;
   sDATAINICIAL, sDATAFINAL  : String;
   sSQL,data_mes,sSit,ID_SITPART,flg_sit:string;
   op,sTotalMes:integer;
begin
  inherited;
  if (edtDataInicial.DateTime <= 0) then begin
    MsgDlg('Período inicial não informado','Erro',mtError,[mbOk],0);
    edtDataInicial.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  if (edtDataFinal.DateTime <= 0) then begin
     MsgDlg('Período final não informado','Erro',mtError,[mbOk],0);
    edtDataFinal.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  if (ListBoxSitParam.Items.Count <= 0) then begin // situação
     MsgDlg('Situação não informada','Erro',mtError,[mbOk],0);
    edtDataFinal.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  if (edtDataInicial.DateTime > edtDataFinal.DateTime) then begin
    MsgDlg('Data inicial não pode ser maior que data final.','Erro',mtError,[mbOk],0);
    edtDataInicial.SetFocus;
    Self.ModalResult := mrNone;
    Exit;
  end;

  //pFlgInterno.Clear;
  pFlgInterno := TStringList.Create;

  For i := 0 to (ListBoxSitParam.Items.Count)-1 Do Begin
     IF ListBoxSitParam.Items.Strings[i] = 'ASSISTIDO' then pFlgInterno.Add('AS');
     IF ListBoxSitParam.Items.Strings[i] = 'ATIVO' then pFlgInterno.Add('AT');
     IF ListBoxSitParam.Items.Strings[i] = 'CANCELADO' then pFlgInterno.Add('CA');
     IF ListBoxSitParam.Items.Strings[i] = 'AUTOPATROCINADO' then pFlgInterno.Add('MA');
     IF ListBoxSitParam.Items.Strings[i] = 'AUTOPATROCINADO PARCIAL' then pFlgInterno.Add('MP');
     IF ListBoxSitParam.Items.Strings[i] = 'BPD' then pFlgInterno.Add('MS');
  End;

  For i := 0 to (pFlgInterno.Count)-1 Do Begin
    If i = 0 then
     pFlgInternoSql := pFlgInterno[i]
    Else
     pFlgInternoSql := pFlgInternoSql + QuotedStr(',') + pFlgInterno[i];
  End;

    //qryAux.Close;
    //qryAux.SQL.Clear;
    //qryAux.SQL.Add('Select * from SITPART where FLGINTERNO in ('''+ copy(trim(pFlgInternoSql),2,length(trim(pFlgInternoSql))-2) +''') ');
    //qryAux.Open;

  with dtmQtdSituacaoPartcip do begin

    sDATAINICIAL := edtDataInicial.Text;
    sDATAFINAL := edtDataFinal.Text;

    {qryConsulta.SQL.Clear;
    qryConsulta.Close;
    qryConsulta.SQL.Add(' select ANODATAEFETIVADO,                                                      ');
    qryConsulta.SQL.Add('       FLGINTERNO,                                                             ');
    qryConsulta.SQL.Add('       NOME,                                                                   ');
    qryConsulta.SQL.Add('       DATAEFETIVADO,                                                          ');
    qryConsulta.SQL.Add('       DATAEFETIVADO_MES,                                                      ');
    qryConsulta.SQL.Add('       IDPLANOPREV,                                                            ');
    qryConsulta.SQL.Add('       IDSITPLANOPREV,                                                         ');
    qryConsulta.SQL.Add('       COUNT(*) AS TOTAL                                                       ');
    qryConsulta.SQL.Add('  from (                                                                       ');
    qryConsulta.SQL.Add('        SELECT EXTRACT(YEAR FROM EFE.DATAEFETIVADO) ANODATAEFETIVADO,          ');
    qryConsulta.SQL.Add('                SP.FLGINTERNO,                                                 ');
    qryConsulta.SQL.Add('                CASE                                                           ');
    qryConsulta.SQL.Add('                  WHEN EFE.IDPLANOPREV = 2 THEN                                ');
    qryConsulta.SQL.Add('                   CASE                                                        ');
    qryConsulta.SQL.Add('                     WHEN PPP.IDSITPLANOPREV = 25 THEN                         ');
    qryConsulta.SQL.Add('                      PP.NOME || '' saldado''                                  ');
    qryConsulta.SQL.Add('                     ELSE                                                      ');
    qryConsulta.SQL.Add('                      PP.NOME || '' não saldado''                              ');
    qryConsulta.SQL.Add('                   END                                                         ');
    qryConsulta.SQL.Add('                  ELSE                                                         ');
    qryConsulta.SQL.Add('                   PP.NOME                                                     ');
    qryConsulta.SQL.Add('                END AS NOME,                                                   ');
    qryConsulta.SQL.Add('                CASE                                                           ');
    qryConsulta.SQL.Add('                  WHEN EFE.DATAEFETIVADO IS NOT NULL THEN                      ');
    qryConsulta.SQL.Add('                   TO_DATE(''01/'' || TO_CHAR(EFE.DATAEFETIVADO, ''mm/yyyy'')) ');
    qryConsulta.SQL.Add('                  ELSE                                                         ');
    qryConsulta.SQL.Add('                   TO_DATE(''01/01/1520'')                                     ');
    qryConsulta.SQL.Add('                END AS DATAEFETIVADO,                                          ');
    qryConsulta.SQL.Add('               TO_CHAR(EFE.DATAEFETIVADO, ''mm/yyyy'') AS DATAEFETIVADO_MES,   ');
    qryConsulta.SQL.Add('                EFE.IDPLANOPREV,                                               ');
    qryConsulta.SQL.Add('                PPP.IDSITPLANOPREV                                             ');
    qryConsulta.SQL.Add('          FROM EVENTOSPREV EFE, PLANPREV PP, PARTPREVPLAN PPP, SITPART SP      ');
    //qryConsulta.SQL.Add('         WHERE EFE.DATAEFETIVADO BETWEEN '01/01/2011' AND '31/01/2011'         ');
    qryConsulta.SQL.Add('           WHERE EFE.DATAEFETIVADO BETWEEN '+ QuotedStr(sDATAINICIAL) +' AND '+ QuotedStr(sDATAFINAL) +' ');
    qryConsulta.SQL.Add('           AND EFE.IDEVENTOGERADOR IN                                          ');
    qryConsulta.SQL.Add('               (SELECT DISTINCT EX.IDEVENTOGERADOR                             ');
    qryConsulta.SQL.Add('                  FROM EVENTOXSITPART EX, SITPART S                            ');
    qryConsulta.SQL.Add('                 WHERE S.IDSITPART = EX.IDSITPART                              ');
    //qryConsulta.SQL.Add('                   AND S.FLGINTERNO in ('MA'))                                 ');
    qryConsulta.SQL.Add('                     AND S.FLGINTERNO in ('''+ pFlgInternoSql +'''))            ');
    qryConsulta.SQL.Add('           AND SP.IDSITPART = efe.IDSITPARTNOVO                                ');
    qryConsulta.SQL.Add('           AND EFE.IDPLANOPREV = PP.IDPLANOPREV                                ');
    qryConsulta.SQL.Add('           AND PPP.IDPESSOA = EFE.IDPESSOA                                     ');
    qryConsulta.SQL.Add('           AND PPP.IDPLANOPREV = EFE.IDPLANOPREV                               ');
    qryConsulta.SQL.Add('           AND (PPP.IDPLANOPREV = 66 AND PPP.IDSITPLANOPREV = 1 OR             ');
    qryConsulta.SQL.Add('               PPP.IDPLANOPREV = 2 AND PPP.IDSITPLANOPREV = 1 OR               ');
    qryConsulta.SQL.Add('               PPP.IDPLANOPREV = 74 AND PPP.IDSITPLANOPREV = 1 OR              ');
    qryConsulta.SQL.Add('               PPP.IDPLANOPREV = 2 AND PPP.IDSITPLANOPREV = 25)                ');
    qryConsulta.SQL.Add('        )                                                                      ');
    qryConsulta.SQL.Add(' GROUP BY ANODATAEFETIVADO,                                                    ');
    qryConsulta.SQL.Add('          FLGINTERNO,                                                          ');
    qryConsulta.SQL.Add('          NOME,                                                                ');
    qryConsulta.SQL.Add('          DATAEFETIVADO,                                                       ');
    qryConsulta.SQL.Add('          DATAEFETIVADO_MES,                                                   ');
    qryConsulta.SQL.Add('          IDPLANOPREV,                                                         ');
    qryConsulta.SQL.Add('          IDSITPLANOPREV                                                       ');
    qryConsulta.SQL.Add(' ORDER BY FLGINTERNO,                                                          ');
    qryConsulta.SQL.Add('          DATAEFETIVADO                                                        ');
    qryConsulta.Open;}

    qryConsulta.SQL.Clear;
    qryConsulta.Close;
    qryConsulta.SQL.Add('  select ANODATAEFETIVADO,                                                     ');
    qryConsulta.SQL.Add('       FLGINTERNO,                                                             ');
    qryConsulta.SQL.Add('       NOME,                                                                   ');
    qryConsulta.SQL.Add('       DATAEFETIVADO,                                                          ');
    qryConsulta.SQL.Add('       DATAEFETIVADO_MES,                                                      ');
    qryConsulta.SQL.Add('       IDPLANOPREV,                                                            ');
    //qryConsulta.SQL.Add('       IDSITPLANOPREV,                                                         ');
    qryConsulta.SQL.Add('       COUNT(*) AS TOTAL                                                       ');
    qryConsulta.SQL.Add('  from (SELECT EXTRACT(YEAR FROM EFE.DATAEFETIVADO) ANODATAEFETIVADO,          ');
    qryConsulta.SQL.Add('               SP.FLGINTERNO,                                                  ');
    qryConsulta.SQL.Add('               CASE                                                            ');
    qryConsulta.SQL.Add('                 WHEN EFE.IDPLANOPREV = 2 THEN                                 ');
    qryConsulta.SQL.Add('                  CASE                                                         ');
    qryConsulta.SQL.Add('                    WHEN PPP.IDSITPLANOPREV = 25 THEN                          ');
    qryConsulta.SQL.Add('                     PP.NOME || '' saldado''                                   ');
    qryConsulta.SQL.Add('                    ELSE                                                       ');
    qryConsulta.SQL.Add('                     PP.NOME || '' não saldado''                               ');
    qryConsulta.SQL.Add('                  END                                                          ');
    qryConsulta.SQL.Add('                 ELSE                                                          ');
    qryConsulta.SQL.Add('                  PP.NOME                                                      ');
    qryConsulta.SQL.Add('               END AS NOME,                                                    ');
    qryConsulta.SQL.Add('               CASE                                                            ');
    qryConsulta.SQL.Add('                 WHEN EFE.DATAEFETIVADO IS NOT NULL THEN                       ');
    qryConsulta.SQL.Add('                  TO_DATE(''01/'' || TO_CHAR(EFE.DATAEFETIVADO, ''mm/yyyy''))  ');
    qryConsulta.SQL.Add('                 ELSE                                                          ');
    qryConsulta.SQL.Add('                  TO_DATE(''01/01/1520'')                                      ');
    qryConsulta.SQL.Add('               END AS DATAEFETIVADO,                                           ');
    qryConsulta.SQL.Add('               TO_CHAR(EFE.DATAEFETIVADO, ''mm/yyyy'') AS DATAEFETIVADO_MES,   ');
    qryConsulta.SQL.Add('               EFE.IDPLANOPREV,                                                ');
    qryConsulta.SQL.Add('               PPP.IDSITPLANOPREV                                              ');
    qryConsulta.SQL.Add('          FROM EVENTOSPREV EFE,                                                ');
    qryConsulta.SQL.Add('               PLANPREV PP,                                                    ');
    qryConsulta.SQL.Add('               PARTPREVPLAN PPP,                                               ');
    qryConsulta.SQL.Add('               (SELECT DISTINCT EX.IDEVENTOGERADOR, S.FLGINTERNO               ');
    qryConsulta.SQL.Add('                  FROM EVENTOXSITPART EX, SITPART S                            ');
    qryConsulta.SQL.Add('                 WHERE S.IDSITPART = EX.IDSITPART                              ');
    //qryConsulta.SQL.Add('                   AND S.FLGINTERNO in ('MA','AT','AS')) SP                    ');
    qryConsulta.SQL.Add('                     AND S.FLGINTERNO in ('''+ pFlgInternoSql +''')) SP        ');
    //qryConsulta.SQL.Add('         WHERE EFE.DATAEFETIVADO BETWEEN '01/01/2011' AND '31/01/2011'         ');
    qryConsulta.SQL.Add('           WHERE EFE.DATAEFETIVADO BETWEEN '+ QuotedStr(sDATAINICIAL) +' AND '+ QuotedStr(sDATAFINAL) +' ');
    qryConsulta.SQL.Add('           AND EFE.IDEVENTOGERADOR = SP.IDEVENTOGERADOR                        ');
    qryConsulta.SQL.Add('           AND EFE.IDPLANOPREV = PP.IDPLANOPREV                                ');
    qryConsulta.SQL.Add('           AND PPP.IDPESSOA = EFE.IDPESSOA                                     ');
    qryConsulta.SQL.Add('           AND PPP.IDPLANOPREV = EFE.IDPLANOPREV)                               ');
    {qryConsulta.SQL.Add('           AND (PPP.IDPLANOPREV = 66 AND PPP.IDSITPLANOPREV = 1 OR             ');
    qryConsulta.SQL.Add('               PPP.IDPLANOPREV = 2 AND PPP.IDSITPLANOPREV = 1 OR               ');
    qryConsulta.SQL.Add('               PPP.IDPLANOPREV = 74 AND PPP.IDSITPLANOPREV = 1 OR              ');
    qryConsulta.SQL.Add('               PPP.IDPLANOPREV = 2 AND PPP.IDSITPLANOPREV = 25))               ');}
    qryConsulta.SQL.Add(' GROUP BY ANODATAEFETIVADO,                                                    ');
    qryConsulta.SQL.Add('          FLGINTERNO,                                                          ');
    qryConsulta.SQL.Add('          NOME,                                                                ');
    qryConsulta.SQL.Add('          DATAEFETIVADO,                                                       ');
    qryConsulta.SQL.Add('          DATAEFETIVADO_MES,                                                   ');
    qryConsulta.SQL.Add('          IDPLANOPREV                                                         ');
    //qryConsulta.SQL.Add('          IDSITPLANOPREV                                                       ');
    qryConsulta.SQL.Add(' ORDER BY FLGINTERNO, ANODATAEFETIVADO, DATAEFETIVADO                                         ');
    qryConsulta.Open;

     data_mes := '';
     flg_sit := '';
     cdsRelat.Close;
     cdsRelat.CreateDataSet();

    if (qryConsulta.Recordcount = 0) then begin
      MsgDlg('Não existe relatório para o período indicado.','Erro',mtError,[mbOk],0);
      edtDataInicial.SetFocus;
      Self.ModalResult := mrNone;
      Exit;
    end;

     qryConsulta.first;

     while not qryConsulta.eof Do
     begin
      If not (qryConsulta.FieldByName('DATAEFETIVADO').AsString = '01/01/1520') then begin
         If (data_mes = qryConsulta.FieldByName('DATAEFETIVADO_MES').AsString) and (flg_sit = qryConsulta.FieldByName('FLGINTERNO').AsString) then Begin
           op := 1; //editar
         end else begin
           data_mes := qryConsulta.FieldByName('DATAEFETIVADO_MES').AsString;
           flg_sit := qryConsulta.FieldByName('FLGINTERNO').AsString;
           op := 0; //gravar
         end;

        //Gravar clientdataset
        if op = 0  then
        begin
                //Gravar
                cdsRelat.Append;
                cdsRelat.fieldbyname('DATA').AsDateTime   := qryConsulta.FieldByName('DATAEFETIVADO').AsDateTime;
                cdsRelat.fieldbyname('DATA_MES').AsString := qryConsulta.FieldByName('DATAEFETIVADO_MES').AsString;
                cdsRelat.fieldbyname('DATA_ANO').AsString := qryConsulta.FieldByName('ANODATAEFETIVADO').AsString;
                cdsRelat.fieldbyname('FLG_INTERNO').AsString := qryConsulta.FieldByName('FLGINTERNO').AsString;

                //If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 66) and (qryConsulta.FieldByName('Idsitplanoprev').AsInteger = 1) then Begin
                If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 66) then Begin

                  cdsRelat.fieldbyname('IDPLANOREB').AsInteger := qryConsulta.FieldByName('IDPLANOPREV').AsInteger;
                  cdsRelat.fieldbyname('DESCRPLANOREB').Asstring := qryConsulta.FieldByName('NOME').AsString;
                  cdsRelat.fieldbyname('QTDPLANOREB').AsInteger := qryConsulta.FieldByName('TOTAL').AsInteger;

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString := '0';
                End;

                //If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 2) and (qryConsulta.FieldByName('Idsitplanoprev').AsInteger = 1) then Begin
                If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 2) and (qryConsulta.FieldByName('NOME').AsString = 'REG/REPLAN não saldado') then Begin
                  cdsRelat.fieldbyname('IDPLANOREGREPLANNS').AsInteger := qryConsulta.FieldByName('IDPLANOPREV').AsInteger;
                  cdsRelat.fieldbyname('DESCRPLANOREGREPLANNS').Asstring := qryConsulta.FieldByName('NOME').AsString;
                  cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsInteger := qryConsulta.FieldByName('TOTAL').AsInteger;

                  If cdsRelat.fieldbyname('QTDPLANOREB').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREB').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString := '0';
                End;

                //If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 74) and (qryConsulta.FieldByName('Idsitplanoprev').AsInteger = 1) then Begin
                If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 74) then Begin
                  cdsRelat.fieldbyname('IDPLANONOVOPL').AsInteger := qryConsulta.FieldByName('IDPLANOPREV').AsInteger;
                  cdsRelat.fieldbyname('DESCRPLANONOVOPL').Asstring := qryConsulta.FieldByName('NOME').AsString;
                  cdsRelat.fieldbyname('QTDPLANONOVOPL').AsInteger := qryConsulta.FieldByName('TOTAL').AsInteger;

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANOREB').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREB').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString := '0';
                End;

                If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 2) and (qryConsulta.FieldByName('NOME').AsString = 'REG/REPLAN saldado') then Begin
                  cdsRelat.fieldbyname('IDPLANOREGREPLANS').AsInteger := qryConsulta.FieldByName('IDPLANOPREV').AsInteger;
                  cdsRelat.fieldbyname('DESCRPLANOREGREPLANS').Asstring := qryConsulta.FieldByName('NOME').AsString;
                  cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsInteger := qryConsulta.FieldByName('TOTAL').AsInteger;

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANOREB').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREB').AsString := '0';
                End;
                cdsRelat.Post;
        end
        else
        begin
                //Editar
                cdsRelat.Edit;

                If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 66) then Begin
                  cdsRelat.fieldbyname('IDPLANOREB').AsInteger := qryConsulta.FieldByName('IDPLANOPREV').AsInteger;
                  cdsRelat.fieldbyname('DESCRPLANOREB').Asstring := qryConsulta.FieldByName('NOME').AsString;
                  cdsRelat.fieldbyname('QTDPLANOREB').AsInteger := qryConsulta.FieldByName('TOTAL').AsInteger;

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString := '0';
                End;

                If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 2) and (qryConsulta.FieldByName('NOME').AsString = 'REG/REPLAN não saldado') then Begin
                  cdsRelat.fieldbyname('IDPLANOREGREPLANNS').AsInteger := qryConsulta.FieldByName('IDPLANOPREV').AsInteger;
                  cdsRelat.fieldbyname('DESCRPLANOREGREPLANNS').Asstring := qryConsulta.FieldByName('NOME').AsString;
                  cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsInteger := qryConsulta.FieldByName('TOTAL').AsInteger;

                  If cdsRelat.fieldbyname('QTDPLANOREB').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREB').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString := '0';
                End;

                If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 74) then Begin
                  cdsRelat.fieldbyname('IDPLANONOVOPL').AsInteger := qryConsulta.FieldByName('IDPLANOPREV').AsInteger;
                  cdsRelat.fieldbyname('DESCRPLANONOVOPL').Asstring := qryConsulta.FieldByName('NOME').AsString;
                  cdsRelat.fieldbyname('QTDPLANONOVOPL').AsInteger := qryConsulta.FieldByName('TOTAL').AsInteger;

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANOREB').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREB').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsString := '0';
                End;

              If (qryConsulta.FieldByName('IDPLANOPREV').AsInteger = 2) and (qryConsulta.FieldByName('NOME').AsString = 'REG/REPLAN saldado') then Begin
                  cdsRelat.fieldbyname('IDPLANOREGREPLANS').AsInteger := qryConsulta.FieldByName('IDPLANOPREV').AsInteger;
                  cdsRelat.fieldbyname('DESCRPLANOREGREPLANS').Asstring := qryConsulta.FieldByName('NOME').AsString;
                  cdsRelat.fieldbyname('QTDPLANOREGREPLANS').AsInteger := qryConsulta.FieldByName('TOTAL').AsInteger;

                  If cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREGREPLANNS').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANONOVOPL').AsString := '0';

                  If cdsRelat.fieldbyname('QTDPLANOREB').AsString = '' then
                    cdsRelat.fieldbyname('QTDPLANOREB').AsString := '0';
                End;

                cdsRelat.Post;
        end;

       end;
        qryConsulta.Next;
     end;

     dtmQtdSituacaoPartcip.pplblDtini.Caption := sDATAINICIAL;
     dtmQtdSituacaoPartcip.pplblDtfim.Caption := sDATAFINAL;

     sSit := '';
     For i := 0 to (ListBoxSitParam.Items.Count)-1 Do Begin
       If sSit = '' then
        sSit := ListBoxSitParam.Items.Strings[i]
       else
        sSit := sSit + ', ' + ListBoxSitParam.Items.Strings[i];
     End;


      if (cdsrelat.recordcount = 0 ) then begin
      MsgDlg('Não existe relatório para o período indicado.','Erro',mtError,[mbOk],0);
      Self.ModalResult := mrNone;
      Abort;
      end;

  end;
end;

end.
