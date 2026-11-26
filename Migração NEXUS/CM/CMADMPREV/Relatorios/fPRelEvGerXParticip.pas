// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit fPRelEvGerXParticip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, Db, DBTables, Wwquery;

type
  TfrmPRelEvGerXParticip = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    edInscr: TEdit;
    edNome: TEdit;
    MontaSelect1: TMontaSelect;
    GroupBox2: TGroupBox;
    dblkpcmbPatro: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    dblkpcmbPlano: TwwDBLookupCombo;
    qryPlano: TwwQuery;
    qryPatro: TwwQuery;
    bbtnProcurar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtRegistroIni: TCMDateTimePicker;
    dtRegistroFim: TCMDateTimePicker;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelEvGerXParticip: TfrmPRelEvGerXParticip;

implementation

{$R *.DFM}

Uses dRelatAdmPrev2, UAdmPrev;

procedure TfrmPRelEvGerXParticip.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect1.executar;
  If MontaSelect1.retornouValor Then
  Begin
    EdNome.Text := MontaSelect1.ValoresChave[1];
    EdInscr.Text := MontaSelect1.ValoresChave[2];
  End;;
end;

procedure TfrmPRelEvGerXParticip.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;

  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPlano.Open;
  
  dtRegistroIni.Date := Now;
  dtRegistroFim.Date := Now;
end;

procedure TfrmPRelEvGerXParticip.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // CRITICA CAMPOS.

  With dtmRelatAdmPrev2.qryEvGerXParticip, dtmRelatAdmPrev2 Do
  Begin
    Sql.Clear;
    Sql.Add(
      ' SELECT T1.IDPESSOA,T2.INSCRICAONUMERO, '+
      '     T7.NOME PLANO, T1.IDEVENTOSPREV, '+
      '     T1.IDEVENTOGERADOR, T4.NOME AS NOME_EVENTO, '+
      '     T1.DATAREGISTRO, T1.DATAEVENTO, T1.DATAALTERADO, '+
      '     T1.IDBENEFICIO, T3.NOME AS NOME_BENEF, '+
      '     T1.SALPARTICIPACAO,T5.NOMEUSUARIO,T6.NOME AS NOME_PESSOA '+
      ' FROM EVENTOSPREV T1, '+
      '     PARTPREVPLAN T2, '+
      '     BENEFICIO T3, '+
      '     EVENTOGERADOR T4, '+
      '     USUARIOSISTEMA T5,PESSOA T6,  PLANPREV T7, PATRO T8 '+ 
      ' WHERE T1.IDPESSOA = T2.IDPESSOA ');

    If MontaSelect1.RetornouValor Then
      Sql.Add(' AND T1.IDPESSOA = '+MontaSelect1.ValoresChave[0]);

    If dblkpcmbPatro.Text <> ''Then
      Sql.Add(' AND T2.IDPESSJUR = '+qryPatro.FieldByName('IDPESSOA').AsString);

    If dblkpcmbPlano.Text <> ''Then
      Sql.Add(' AND T2.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString);

    If dtRegistroIni.Text <> ''Then
      Sql.Add(' AND  (T1.DATAREGISTRO BETWEEN TO_DATE('''+dtRegistroIni.Text+''',''DD/MM/YYYY'') AND TO_DATE('''+dtRegistroFim.Text+''',''DD/MM/YYYY''))');

      Sql.Add(
      '    AND T1.IDPESSJUR = T2.IDPESSJUR AND T1.IDPLANOPREV = T2.IDPLANOPREV '+
      '    AND T8.IDPESSOA = T2.IDPESSJUR '+           
      '    AND T8.IDFUNDACAO = '+IntToStr(iIdFundacao)+
      '    AND T1.IDBENEFICIO = T3.IDBENEFICIO(+) '+
      '    AND T1.IDEVENTOGERADOR = T4.IDEVENTOGERADOR '+
      '    AND SUBSTR(T1.TRGUSERINCLUSAO,3,5) = T5.IDUSUARIO(+) '+
      '    AND T1.IDPESSOA = T6.IDPESSOA '+
      '    AND T7.IDPLANOPREV = T2.IDPLANOPREV '+

      ' ORDER BY T1.DATAREGISTRO,T1.DATAEVENTO ');

    lblDataIni.Caption := dtRegistroIni.Text;
    lblDataFim.Caption := dtRegistroFim.Text;
  End; // WITH
end;

procedure TfrmPRelEvGerXParticip.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect1.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

end.
