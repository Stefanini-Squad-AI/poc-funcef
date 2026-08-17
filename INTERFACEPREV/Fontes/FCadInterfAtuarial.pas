unit FCadInterfAtuarial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, DBaseDados, Wwdatsrc;

type
  TfrmCadInterfAtuarial = class(TfrmOkCancelar)
    lblSalMedioContrib: TLabel;
    Panel1: TPanel;
    stPlano: TStaticText;
    stNomePlano: TStaticText;
    qryRgSalMediaAtu: TwwQuery;
    qryPlano: TwwQuery;
    dblkpcmbResControle: TCMDBLookupCombo;
    lblReservaControle: TLabel;
    qryResControle: TwwQuery;
    lkpcmbSalMedioContrib: TCMDBLookupCombo;
    dsPlano: TDataSource;
    updPlano: TUpdateSQL;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadInterfAtuarial: TfrmCadInterfAtuarial;

implementation

uses FPrincipal, UMensErro, UDataBase, UAdmPrev;

{$R *.DFM}

procedure TfrmCadInterfAtuarial.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if Trim(lkpcmbSalMedioContrib.Text) = '' then
  begin
     MsgDlg('Regra de Cálculo do Salário Médio de Contribuição não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     lkpcmbSalMedioContrib.SetFocus;
     Abort;
  end;

  if Trim(lkpcmbSalMedioContrib.Text) = '' then
  begin
     MsgDlg('Reserva a considerar como controle não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     lkpcmbSalMedioContrib.SetFocus;
     Abort;
  end;

  try
    qryPlano.FieldbyName('IDPLANOATU').AsInteger := qryResControle.FieldByName('IDPLANOPREV').AsInteger;
    qryPlano.post;
    qryPlano.ApplyUpdates;
    qryPlano.CommitUpdates;

    bbtnConfirmar.Enabled := False;

    MsgDlg('Gravação dos parâmetros do Plano efetuado com Sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0);

  except
    MsgDlg('Ocorreu um erro na gravação dos parâmetros do Plano. ','Erro',mtError,[mbOk,mbHelp],0);
    qryPlano.CancelUpdates;
    qryPlano.CommitUpdates;
    Raise;
  end;

end;

procedure TfrmCadInterfAtuarial.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qryPlano.CancelUpdates;
  qryPlano.CommitUpdates;

end;

procedure TfrmCadInterfAtuarial.FormShow(Sender: TObject);
begin
  inherited;
  qryRgSalMediaAtu.Close;
  qryRgSalMediaAtu.Open;

  qryResControle.Close;
  qryResControle.ParamByName('IDPLANOPREV').AsInteger := strToInt(sIdPlano);
  qryResControle.Open;

  stNomePlano.Caption:=sNomePlano;

  qryPlano.Close;
  qryPlano.ParamByName('IDPLANOPREV').AsInteger := strToInt(sIdPlano);
  qryPlano.Open;
  qryPlano.edit;


  bbtnConfirmar.Enabled := True;

end;

end.
