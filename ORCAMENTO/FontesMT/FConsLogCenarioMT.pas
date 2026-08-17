Unit
  FConsLogCenarioMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBClient, uCMClientDataSet, uCmSqlParams, Grids,
  Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker;

Type
  TfrmConsLogCenarioMT = class(TfrmSairAjuda)
    Panel1: TPanel;
    dbgLogCenario: TwwDBGrid;
    sqlLogCenario: TCMSqlParams;
    cdsLogCenario: TCMClientDataSet;
    dtsLogCenario: TDataSource;
    dteDataIni: TCMDateTimePicker;
    dteDataFim: TCMDateTimePicker;
    btnPesquisar: TBitBtn;
    Label10: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  frmConsLogCenarioMT: TfrmConsLogCenarioMT;

Implementation

Uses
  uMensErro;

{$R *.DFM}
//************************************************
Procedure TfrmConsLogCenarioMT.btnPesquisarClick(Sender: TObject);
Begin
  Inherited;

  If ( dteDataIni.Text <> '' ) And
     ( dteDataFim.Text <> '' ) And
     ( dteDataIni.Date > dteDataFim.Date ) Then Begin

    MsgDlg( 'Data inconsistentes', 'Aviso', mtError, [ mbOk ], 0 );

  End Else Begin

    sqlLogCenario.SQL.Clear;
    sqlLogCenario.SQL.Add( 'SELECT' );
    sqlLogCenario.SQL.Add( '  LC.*,' );
    sqlLogCenario.SQL.Add( '  CE.NOMECENARIO CENARIOEFETIVADO,' );
    sqlLogCenario.SQL.Add( '  CS.NOMECENARIO CENARIOSALVO,' );
    sqlLogCenario.SQL.Add( '  US.NOMEUSUARIO' );
    sqlLogCenario.SQL.Add( 'FROM' );
    sqlLogCenario.SQL.Add( '  LOGCENARIO     LC,' );
    sqlLogCenario.SQL.Add( '  CENARIOORCAMEN CE,' );
    sqlLogCenario.SQL.Add( '  CENARIOORCAMEN CS,' );
    sqlLogCenario.SQL.Add( '  USUARIOSISTEMA US' );
    sqlLogCenario.SQL.Add( 'WHERE' );

    If ( dteDataIni.Text <> '' ) Then Begin
      sqlLogCenario.SQL.Add( '  LOGCDATA >= ' + QuotedStr( dteDataIni.Text ) + ' AND' );
    End;

    If ( dteDataFim.Text <> '' ) Then Begin
      sqlLogCenario.SQL.Add( '  LOGCDATA <= ' + QuotedStr( DateToStr( dteDataFim.Date + 1 ) ) + ' AND' );
    End;

    sqlLogCenario.SQL.Add( '  CE.IDCENARIOORCAMEN(+) = LC.LOGCEFETIVADO AND' );
    sqlLogCenario.SQL.Add( '  CS.IDCENARIOORCAMEN(+) = LC.LOGCSALVO     AND' );
    sqlLogCenario.SQL.Add( '  US.IDUSUARIO       (+) = LC.IDUSUARIO' );


    sqlLogCenario.SQL.Add( 'ORDER BY' );
    sqlLogCenario.SQL.Add( '  LOGCDATA DESC' );
    sqlLogCenario.Prepare;
    sqlLogCenario.Open;
  End;
End;
//************************************************
End.
