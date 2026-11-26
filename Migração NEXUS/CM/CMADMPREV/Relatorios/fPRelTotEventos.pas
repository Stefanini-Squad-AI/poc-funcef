// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit fPRelTotEventos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  Db, DBTables, Wwquery;

type
  TfrmPRelTotEventos = class(TfrmOkCancelar)
    GroupBox2: TGroupBox;
    dblkpcmbPatro: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    dblkpcmbPlano: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtRegistroIni: TCMDateTimePicker;
    dtRegistroFim: TCMDateTimePicker;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelTotEventos: TfrmPRelTotEventos;

implementation

{$R *.DFM}

Uses dRelatAdmPrev2, UAdmPrev;

procedure TfrmPRelTotEventos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  With dtmRelatAdmPrev2.qryTotEventos, dtmRelatAdmPrev2 Do
  Begin
    Sql.Clear;
    Sql.Add(
      ' SELECT COUNT(*), T1.IDPLANOPREV, T3.NOME, T1.IDPESSJUR, T4.RAZAOSOCIAL, '+
      '    T1.IDEVENTOGERADOR,  T2.NOME AS NOME_EVENTO, '+
      '    TO_CHAR(T1.DATAREGISTRO,''YYYYMM'') AS REFER_YYYYMM, '+
      '    TO_CHAR(T1.DATAREGISTRO,''MM/YYYY'') AS CONTROLE '+
      ' FROM EVENTOSPREV T1, EVENTOGERADOR T2, PLANPREV T3, PESSOA T4, PATRO T5 '+
      ' WHERE   T1.IDEVENTOGERADOR = T2.IDEVENTOGERADOR '+
      ' AND     T5.IDPESSOA        = T1.IDPESSJUR '+           
      ' AND     T5.IDFUNDACAO      = '+IntToStr(iIdFundacao)); 

    If dtRegistroIni.Text <> '' Then
      Sql.Add(' AND  (T1.DATAREGISTRO BETWEEN TO_DATE('''+dtRegistroIni.Text+''',''DD/MM/YYYY'') AND TO_DATE('''+dtRegistroFim.Text+''',''DD/MM/YYYY''))');

    If dblkpcmbPatro.Text <> '' Then
      Sql.Add(' AND T1.IDPESSJUR = '+qryPatro.FieldByName('IDPESSOA').AsString);

    If dblkpcmbPlano.Text <> '' Then
      Sql.Add(' AND T1.IDPLANOPREV = '+qryPlano.FieldByName('IDPLANOPREV').AsString);

    Sql.Add(
      ' AND     T1.IDPLANOPREV     = T3.IDPLANOPREV '+
      ' AND     T1.IDPESSJUR       = T4.IDPESSOA '+
      ' GROUP BY  TO_CHAR(T1.DATAREGISTRO,''YYYYMM''), TO_CHAR(T1.DATAREGISTRO,''MM/YYYY''), '+
      '    T1.IDPLANOPREV, T3.NOME, T1.IDPESSJUR, T4.RAZAOSOCIAL, '+
      '    T1.IDEVENTOGERADOR, T2.NOME '+
      ' ORDER BY  TO_CHAR(T1.DATAREGISTRO,''YYYYMM'') ' );

      lblDataIni2.Caption := dtRegistroIni.Text;
      lblDataFim2.Caption := dtRegistroFim.Text;
    End;
end;

procedure TfrmPRelTotEventos.FormCreate(Sender: TObject);
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

procedure TfrmPRelTotEventos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPlano.Close;
  qryPatro.Close;
end;

end.
