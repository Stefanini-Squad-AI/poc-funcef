unit fParamRelMovReservaGeral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, Mask;

type
  TfrmParamRelMovReservaGeral = class(TfrmOkCancelar)
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edMesCobIni: TMaskEdit;
    edMesCobFim: TMaskEdit;
    qryPatro: TwwQuery;
    dblkpcmbPatro: TwwDBLookupCombo;
    qryPlanos: TwwQuery;
    dblkpcmbPlano: TwwDBLookupCombo;
    qryparamglobal: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbPlanoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelMovReservaGeral: TfrmParamRelMovReservaGeral;

implementation

uses DRelatorios, UMensErro, USistema, UAdmPrev;

{$R *.DFM}

procedure TfrmParamRelMovReservaGeral.FormShow(Sender: TObject);
begin
  inherited;
  qryPatro.Open;

  qryPlanos.SQL.Clear;
  qryPlanos.SQL.Add('SELECT IDPLANOPREV, NOME FROM PLANPREV');
  qryPlanos.Open;

  qryparamglobal.Close;
  qryparamglobal.parambyname('IDEMPRESA').AsString := inttostr(sistema.IdEmpresa);
  qryparamglobal.open;
  
end;

procedure TfrmParamRelMovReservaGeral.dblkpcmbPlanoClick(Sender: TObject);
Var
 sSql : String;
begin
  inherited;
  If dblkpcmbPlano.Text <> ''
   Then sSql := ' SELECT IDPLANOPREV, NOME FROM PLANPREV'
   Else sSql := ' SELECT PL.IDPLANOPREV, PL.NOME '+
                ' FROM PLANPREV PL, PLANPREVPATRO PP '+
                ' WHERE PP.IDPESSJUR = '+dblkpcmbPatro.LookupValue+
                ' AND PP.IDPLANOPREV = PL.IDPLANOPREV';

  qryPlanos.Close;
  qryPlanos.SQL.Clear;
  qryPlanos.SQL.Add(sSql);
  qryPlanos.Open;

end;

procedure TfrmParamRelMovReservaGeral.bbtnConfirmarClick(Sender: TObject);
Var
 sSql : String;
begin
  if Trim(dblkpcmbPatro.Text) = ''
  then begin
     MsgDlg('Patrocinadora não selecionada!!','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if Trim(dblkpcmbPlano.Text) = ''
  then begin
     MsgDlg('Plano não selecionado!!','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;


  sSQL := ' SELECT H.IDHISTRESERVA,H.IDEVENTOGERADOR,H.IDPLANOPREV,H.IDCONTRIBUICAO,H.IDBENEFICIO,H.IDTIPORESERVA, '+
          '        H.IDPESSJUR ,H.IDPESSOA   ,H.DATAMOV   ,H.VLRREAL , H.SALDOREAL, VLRCOTAS  ,H.SALDOCOTAS     , '+
          '        DECODE(FLGENTRADA,0,H.VLRREAL) VLRREALSAIDA, '+
          '        DECODE(FLGENTRADA,1,H.VLRREAL) VLRREALENT, '+
          '        DECODE(FLGENTRADA,0,H.VLRCOTAS) COTASSAIDA, '+
          '        DECODE(FLGENTRADA,1,H.VLRCOTAS) COTASENT , '+
          '        DECODE(FLGENTRADA,0,(H.SALDOREAL) + H.VLRREAL,1,H.SALDOREAL - VLRREAL) AS VLRREALANT,  '+
          '        DECODE(FLGENTRADA,0,((H.SALDOCOTAS) + H.VLRCOTAS)  ,1, (H.SALDOCOTAS - VLRCOTAS) ) AS VLRCOTASANT , '+
          '        BENEFICIO.NOME BENEFICIO, RESERVAXPLANO.NOME RESERVA, PLANPREV.NOME PLANPREV, '+
          '        PESSOA.NOME PESSOA , PESSJUR.NOME PESSJUR , CONTRIBUICAO.NOME CONTRIBUICAO , EVENTOGERADOR.NOME EVENTO ,'+
          '        DECODE(FLGENTRADA,1,''Entrada'',0,''Saída'') FLGENTRADA, FLGENTRADA ENTRADA,'+
          '        PARTPREVPLAN.INSCRICAONUMERO, ELEGPATRO.MATRICULA, INDICEREAJUSTE, '+
          '        MOEDA.MOESIGLA, MOEDAEMP.MOESIGLA SIGLAEMP, H.SEQPROPOSTA, H.VALORINDICE,   '+
          '        H.FLGPROCEDENCIA, '+
          '        H.MESREFERENCIA, H.DATAALIMENTACAO , ELEGPATRO.IDESTAB, REG.NOME' +
          ' FROM   PLANPREV ,CONTRIBUICAO, BENEFICIO, MOEDA , MOEDA MOEDAEMP, '+
          '        RESERVAXPLANO ,EVENTOGERADOR, PARTPREVPLAN ,  ELEGPATRO, RESERVAPART ,   '+
          '        PESSOA , PESSOA PESSJUR,  HISTMOVRESERVA H , PESSOA REG'+
          ' WHERE  (H.IDPESSJUR   = '+dblkpcmbPatro.LookupValue+') '+
          ' AND    (H.IDPLANOPREV = '+dblkpcmbPlano.LookupValue+') ';

     if (Trim(edMesCobIni.Text) <> '') and (Trim(edMesCobIni.Text) <> '/')
     then sSQL := sSQL + ' AND (H.MESREFERENCIA >= '''+edMesCobIni.Text+''') ';

     if (Trim(edMesCobFim.Text) <> '') and (Trim(edMesCobFim.Text) <> '/')
     then sSQL := sSQL + ' AND (H.MESREFERENCIA <= '''+edMesCobFim.Text+''') ';

     sSQL := sSQL + ' AND    (H.IDPESSOA = PESSOA.IDPESSOA )                   '+
          ' AND    (MOEDAEMP.MOECODIGO = '+qryparamglobal.fieldbyname('MOEDACORRENTE').AsString+' ) '+
          ' AND (H.SEQPROPOSTA = 1  )            '+
          ' AND (RESERVAPART.SEQPROPOSTA = 1 )  '+
          ' AND (H.IDTIPORESERVA = RESERVAPART.IDTIPORESERVA) '+
          ' AND (H.IDPESSOA      = RESERVAPART.IDPESSOA)      '+
          ' AND (H.IDPESSJUR     = RESERVAPART.IDPESSJUR)     '+
          ' AND (H.IDPLANOPREV   = RESERVAPART.IDPLANOPREV)   '+
          ' AND (RESERVAPART.IDTIPORESERVA = RESERVAXPLANO.IDTIPORESERVA)  '+
          ' AND (RESERVAPART.IDPLANOPREV   = RESERVAXPLANO.IDPLANOPREV)    '+
          ' AND (RESERVAXPLANO.IDPLANOPREV = PLANPREV.IDPLANOPREV )        '+
          ' AND (H.IDEVENTOGERADOR = EVENTOGERADOR.IDEVENTOGERADOR(+) )    '+
          ' AND (H.IDCONTRIBUICAO = CONTRIBUICAO.IDCONTRIBUICAO(+) )       '+
          ' AND (H.IDBENEFICIO = BENEFICIO.IDBENEFICIO(+) )                '+
          ' AND (H.IDPESSJUR = PESSJUR.IDPESSOA )                          '+
          ' AND (RESERVAPART.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV)       '+
          ' AND (RESERVAPART.IDPESSOA    = PARTPREVPLAN.IDPESSOA )         '+
          ' AND (RESERVAPART.SEQPROPOSTA = PARTPREVPLAN.SEQPROPOSTA)       '+
          ' AND (RESERVAPART.IDPESSJUR   = PARTPREVPLAN.IDPESSJUR )        '+
          ' AND (RESERVAXPLANO.INDICEREAJUSTE = MOEDA.MOECODIGO(+))        '+
          ' AND (PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR)             '+
          ' AND (PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA)               '+
          ' AND (ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA)                     '+
          ' AND (ELEGPATRO.IDESTAB = REG.IDPESSOA(+))                      '+
          ' ORDER BY IDESTAB, PESSOA ,PESSJUR, PLANPREV, RESERVA, H.MESREFERENCIA, H.IDHISTRESERVA ';

  with dtmRelatorios.qryMov do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
  end;

  with dtmRelatorios do
  begin
     if (Trim(edMesCobIni.Text) <> '') and (Trim(edMesCobIni.Text) <> '/') and
        (Trim(edMesCobFim.Text) <> '') and (Trim(edMesCobFim.Text) <> '/')
     then ppLabel143.Caption := 'De '+edMesCobIni.Text + ' a '+edMesCobFim.Text
     else begin
        if (Trim(edMesCobIni.Text) <> '') and (Trim(edMesCobIni.Text) <> '/')
        then ppLabel143.Caption := 'A Partir de '+edMesCobIni.Text + ' até hoje '
        else if (Trim(edMesCobFim.Text) <> '') and (Trim(edMesCobFim.Text) <> '/')
             then ppLabel143.Caption := ' Até '+edMesCobFim.Text
             else ppLabel143.Caption := ' Completo ';
     end;

  end;

  inherited;
end;

end.
