unit fParamCompRecPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, Mask,
  wwdbedit, Wwdbspin, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCompRecPag = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    dblkcmbAtividade: TwwDBLookupCombo;
    Label1: TLabel;
    dblkcmbCentro: TwwDBLookupCombo;
    Label2: TLabel;
    rgrpTipo: TRadioGroup;
    rgrpFormato: TRadioGroup;
    gryCentro: TwwQuery;
    gryAtiv: TwwQuery;
    mmAviso: TMemo;
    gbGrauMaximo: TGroupBox;
    seGrauMaxCAP: TwwDBSpinEdit;
    seGrauMaxCAR: TwwDBSpinEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompRecPag: TfrmCompRecPag;
  sMascaraCAR,sMascaraCAP : String;

implementation

uses DRelatoriosCFinan, usistema,uFuncaoGeral,uIntegraBack;

{$R *.DFM}

procedure TfrmCompRecPag.FormCreate(Sender: TObject);
begin
  inherited;
  deDataInicial.Date:=Now;
  deDataFinal.Date:=Now;
end;

procedure TfrmCompRecPag.bbtnConfirmarClick(Sender: TObject);
var sAux : String;
    iAux,iNumMaxEle : Integer;
begin
  inherited;
  if rgrpTipo.ItemIndex=0 then begin
     sAux:=FloatToStr(seGrauMaxCAR.Value);
     iAux:=StrToInt(sAux);
     iNumMaxEle:=FuncaoGeral.CalcNumEleGrau(sMascaraCAR,iAux);
  end else begin
     sAux:=FloatToStr(seGrauMaxCAP.Value);
     iAux:=StrToInt(sAux);
     iNumMaxEle:=FuncaoGeral.CalcNumEleGrau(sMascaraCAP,iAux);
  end;
  //
  dtmRelatoriosCFinan.gryCompRecPag.Close;
  dtmRelatoriosCFinan.gryCompRecPag.Sql.Text :=
' SELECT '+
'   T.DESCRICAO, '+
'   F.RECPAG, '+
'   SUBSTR(F.CODTIPRECDES,1,'+IntToStr(iNumMaxEle)+') AS CODTIPRECDES, '+
'   SUM(F.VALOR*CV.COTVALOR) AS VALORC '+
' FROM '+
'   FLUXOREAL F, '+
'   TIPORECEBDESEMB T, '+
'   (SELECT C.MOECODIGO,C.COTDATA,C.COTVALOR FROM COTACAOMOEDA C, '+
'                  (SELECT MOECODIGO,MAX(COTDATA) AS DATA FROM COTACAOMOEDA GROUP BY MOECODIGO) CD '+
'    WHERE '+
'      C.MOECODIGO = CD.MOECODIGO '+
'      AND C.COTDATA = CD.DATA) CV '+
' WHERE '+
'       F.DATACFLOAT >= TO_DATE('''+deDataInicial.Text+''',''DD/MM/YYYY'')'+
'   AND F.DATACFLOAT <= TO_DATE('''+deDataFinal.Text+''',''DD/MM/YYYY'')';
   if Trim(dblkcmbAtividade.text ) <> '' then
        dtmRelatoriosCFinan.gryCompRecPag.SQL.add(' AND F.UNIDNEGOC = ' + trim(dblkcmbAtividade.LookupValue));
   if Trim(dblkcmbCentro.text ) <> '' then
        dtmRelatoriosCFinan.gryCompRecPag.SQL.add(' AND RTRIM(F.CODCENTRORESPON) = ''' + trim(dblkcmbCentro.LookupValue)+'''');
   case rgrpTipo.ItemIndex of
      0 : dtmRelatoriosCFinan.gryCompRecPag.SQL.add(' AND F.RECPAG = ''R'' ');
      1 : dtmRelatoriosCFinan.gryCompRecPag.SQL.add(' AND F.RECPAG = ''P'' ');
   end;
     dtmRelatoriosCFinan.gryCompRecPag.SQL.Add(
'   AND F.IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+
'   AND CV.MOECODIGO = F.MOECODIGO '+
'   AND SUBSTR(F.CODTIPRECDES,1,'+IntToStr(iNumMaxEle)+') = RTRIM(T.CODTIPRECDES)'+
'   AND F.RECPAG = T.RECPAG '+
'   AND F.IDPESSOA = T.IDPESSOA '+
' GROUP BY '+
'   T.DESCRICAO, '+
'   F.RECPAG, '+
'   SUBSTR(F.CODTIPRECDES,1,'+IntToStr(iNumMaxEle)+')'+
' ORDER BY '+
'   VALORC ');
      dtmRelatoriosCFinan.lbTitulo.caption := 'Composição dos ' + rgrpTipo.Items.strings[rgrpTipo.itemindex];
      dtmRelatoriosCFinan.lbDataComposicao.caption := deDataInicial.Text+ ' à ' + deDataFinal.Text;
   if Trim(dblkcmbCentro.text ) <> '' then
      dtmRelatoriosCFinan.lbCentroRespos.caption := dblkcmbCentro.Text
     else
      dtmRelatoriosCFinan.lbCentroRespos.caption := 'Todos';
   if Trim(dblkcmbAtividade.text ) <> '' then
      dtmRelatoriosCFinan.lbAtividade.caption := dblkcmbAtividade.Text
     else
      dtmRelatoriosCFinan.lbAtividade.caption := 'Todos';
      dtmRelatoriosCFinan.gryCompRecPag.Open;
    case rgrpFormato.ItemIndex of
       0: begin
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Series[0].Active := true;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Series[1].Active := false;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Series[2].Active := false;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.View3D := true;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Chart3DPercent := 5;
          end;
       1: begin
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Series[0].Active := false;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Series[1].Active := true;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Series[2].Active := false;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.View3D := true;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Chart3DPercent := 25;
          end;
       2: begin
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Series[0].Active := false;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Series[1].Active := false;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Series[2].Active := true;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.View3D := true;
            dtmRelatoriosCFinan.rpCompRecPagDBTeeChart1.Chart.Chart3DPercent := 25;
          end;
    end;
end;

procedure TfrmCompRecPag.FormActivate(Sender: TObject);
begin
  inherited;
  deDataInicial.Text := DateToStr(Date);
  deDataFinal.Text   := DateToStr(Date);
  //
  gryCentro.Close;
  gryCentro.SQL.Text:='SELECT CODCENTRORESPON,NOME FROM CENTRESPON  WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+
                      ' ORDER BY NOME';
  gryCentro.Open;
  //
  gryAtiv.Close;
  gryAtiv.SQL.Text:='SELECT UNIDNEGOC,NOME FROM UNIDNEGOCIO  WHERE IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+
                    ' ORDER BY NOME';
  gryAtiv.Open;
  //
  sMascaraCAR:=IntegraBack.MascaraReceb;
  sMascaraCAP:=IntegraBack.MascaraDesemb;
  seGrauMaxCAR.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAR);
  seGrauMaxCAP.MaxValue:=FuncaoGeral.CalcGrauMax(sMascaraCAP);
end;


end.
