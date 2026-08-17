// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 21.08.2003
// Alteração   : RETIRADA DO MES DE REFERENCIA DO ORDER BY POIS NÃO MOSTRA NA ORDEM EM QUE FOI ALIMENTADA
//                        E COM ISSO A COLUNA SALDO APARECE ERRADA
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FParamRelMovReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, DRelatAdmPrev, Db, DBTables,
  Wwquery, Mask;

type
  TfrmParamRelMovReserva = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    bbtnProcurar: TBitBtn;
    MontaSelect: TMontaSelect;
    qryparamglobal: TwwQuery;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edParticipante: TEdit;
    edMatricula: TEdit;
    edNumInsc: TEdit;
    edPatrocinadora: TEdit;
    edPlano: TEdit;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edMesCobIni: TMaskEdit;
    edMesCobFim: TMaskEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    CbTipoReserva: TComboBox;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sFlgInterno,
    sIdPessoa, sIdPessJur : string;
    procedure LimpaCampos;
  public
    { Public declarations }
  end;

var
  frmParamRelMovReserva: TfrmParamRelMovReserva;

implementation

uses DRelatorios, UMensErro, UAdmPrev, USistema;

{$R *.DFM}

procedure TfrmParamRelMovReserva.LimpaCampos;
begin
   edParticipante.Text  := '';
   edMatricula.Text     := '';
   edPatrocinadora.Text := '';
   edNumInsc.Text       := '';
   edPlano.Text         := '';
   sIdPessoa            := '-1';
   sIdPessJur           := '-1';
end;

procedure TfrmParamRelMovReserva.bbtnProcurarClick(Sender: TObject);
var sSQL : string;
begin
  inherited;
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     sIdPessoa            := MontaSelect.ValoresChave[0];
     sIdPessJur           := MontaSelect.ValoresChave[1];
     edParticipante.Text  := MontaSelect.ValoresChave[3];
     edPatrocinadora.Text := MontaSelect.ValoresChave[4];
     edPlano.Text         := MontaSelect.ValoresChave[5];
     edMatricula.Text     := MontaSelect.ValoresChave[7];
     edNumInsc.Text       := MontaSelect.ValoresChave[8];
     sFlgInterno          := MontaSelect.ValoresChave[9]; 
  end
  else LimpaCampos;
end;

procedure TfrmParamRelMovReserva.FormShow(Sender: TObject);
begin
  inherited;
  LimpaCampos;
  MontaSelect.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

end;

procedure TfrmParamRelMovReserva.bbtnConfirmarClick(Sender: TObject);
var sOper, sEnd, sSQL,
    sIdRubrica : string;
begin
  if Trim(edParticipante.Text) = ''
  then begin
     MsgDlg('Selecione o Processo','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;


  sSQL := ' SELECT H.IDHISTRESERVA,H.IDEVENTOGERADOR,H.IDPLANOPREV,H.IDCONTRIBUICAO,H.IDBENEFICIO,H.IDTIPORESERVA,        '+
          '        H.IDPESSJUR ,H.IDPESSOA   ,H.DATAMOV   ,H.VLRREAL , H.SALDOREAL, VLRCOTAS  ,H.SALDOCOTAS     ,         '+
          '        DECODE(FLGENTRADA,0,H.VLRREAL) VLRREALSAIDA,                                                           '+
          '        DECODE(FLGENTRADA,1,H.VLRREAL) VLRREALENT,                                                             '+
          '        DECODE(FLGENTRADA,0,H.VLRCOTAS) COTASSAIDA,                                                            '+
          '        DECODE(FLGENTRADA,1,H.VLRCOTAS) COTASENT ,                                                             '+
          '        DECODE(FLGENTRADA,0,(H.SALDOREAL) + H.VLRREAL,1,H.SALDOREAL - VLRREAL) AS VLRREALANT,                  '+
          '        DECODE(FLGENTRADA,0,((H.SALDOCOTAS) + H.VLRCOTAS)  ,1, (H.SALDOCOTAS - VLRCOTAS) ) AS VLRCOTASANT,      '+
          '        BENEFICIO.NOME BENEFICIO, RESERVAXPLANO.NOME RESERVA, PLANPREV.NOME PLANPREV,                           '+
          '        PESSOA.NOME PESSOA , PESSJUR.NOME PESSJUR , CONTRIBUICAO.NOME CONTRIBUICAO , EVENTOGERADOR.NOME EVENTO ,'+
          '        DECODE(FLGENTRADA,1,''Entrada'',0,''Saída'') FLGENTRADA, FLGENTRADA ENTRADA,'+
          '        PARTPREVPLAN.INSCRICAONUMERO, ELEGPATRO.MATRICULA, INDICEREAJUSTE, '+
          '        MOEDA.MOESIGLA, MOEDAEMP.MOESIGLA SIGLAEMP, H.SEQPROPOSTA, H.VALORINDICE,   '+
          '        H.FLGPROCEDENCIA,                                                           '+
          '        H.MESREFERENCIA, H.DATAALIMENTACAO , ELEGPATRO.IDESTAB, REG.NOME,           '+
          '        DECODE(RESERVAXPLANO.FLGMODATUALIZACAO, 0, ''Reserva Atualizada por Cota'', ''Reserva Atualizada por Índice'') AS MODOATUALIZA, '+
          '        DECODE(RESERVAXPLANO.FLGMODATUALIZACAO, 0, ''[Cota]'', ''[Índice]'') AS NOMETIPOINDICE, '+
          '        RESERVAXPLANO.FLGMODATUALIZACAO                                                         '+
          ' FROM   PLANPREV ,CONTRIBUICAO, BENEFICIO, MOEDA , MOEDA MOEDAEMP, '+
          '        RESERVAXPLANO ,EVENTOGERADOR, PARTPREVPLAN ,  ELEGPATRO, RESERVAPART ,   '+
          '        PESSOA , PESSOA PESSJUR,  HISTMOVRESERVA H , PESSOA REG'+
          ' WHERE  (H.IDPESSJUR   = '+MontaSelect.ValoresChave[1]+') '+
          ' AND    (H.IDPESSOA    = '+MontaSelect.ValoresChave[0]+') '+
          ' AND    (H.IDPLANOPREV = '+MontaSelect.ValoresChave[2]+') ';

     if (Trim(edMesCobIni.Text) <> '') and (Trim(edMesCobIni.Text) <> '/')
     then sSQL := sSQL + ' AND (H.MESREFERENCIA >= '''+edMesCobIni.Text+''') ';

     if (Trim(edMesCobFim.Text) <> '') and (Trim(edMesCobFim.Text) <> '/')
     then sSQL := sSQL + ' AND (H.MESREFERENCIA <= '''+edMesCobFim.Text+''') ';

     If CbTipoReserva.Text = 'Ativa' Then Begin
       sSQL := sSQL + ' AND (RESERVAXPLANO.FLGCONTROLE = 0) ';
     End Else If CbTipoReserva.Text = 'Controle' Then Begin
       sSQL := sSQL + ' AND (RESERVAXPLANO.FLGCONTROLE = 1) ';
     End;

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
          ' ORDER BY IDESTAB, PESSOA ,PESSJUR, PLANPREV, RESERVAXPLANO.FLGMODATUALIZACAO, RESERVA, H.IDHISTRESERVA ';

  with dtmRelatorios.qryMovPart do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
  end;

  with dtmRelatorios do
  begin
     if (Trim(edMesCobIni.Text) <> '') and (Trim(edMesCobIni.Text) <> '/') and
        (Trim(edMesCobFim.Text) <> '') and (Trim(edMesCobFim.Text) <> '/')
     then pplblMovReservaPeriodo.Caption := 'De '+edMesCobIni.Text + ' a '+edMesCobFim.Text
     else begin
        if (Trim(edMesCobIni.Text) <> '') and (Trim(edMesCobIni.Text) <> '/')
        then pplblMovReservaPeriodo.Caption := 'A Partir de '+edMesCobIni.Text + ' até hoje '
        else if (Trim(edMesCobFim.Text) <> '') and (Trim(edMesCobFim.Text) <> '/')
             then pplblMovReservaPeriodo.Caption := ' Até '+edMesCobFim.Text
             else pplblMovReservaPeriodo.Caption := ' Completo ';
     end;

  end;

  inherited;
end;

procedure TfrmParamRelMovReserva.FormCreate(Sender: TObject);
begin
  inherited;
  qryparamglobal.Close;
  qryparamglobal.parambyname('IDEMPRESA').AsString := inttostr(sistema.IdEmpresa);
  qryparamglobal.open;

end;

end.
