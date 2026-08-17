unit FVinculaOrcadoContabilParametros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, TB97, TB97Tlbr, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Db, DBGrids, ExtCtrls;

type
  TFrmVinculaOrcadoContabilparamatros = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    bbtnConfirmar: TBitBtn;
    pgcDados: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    gridPlano: TwwDBGrid;
    gridPatro: TwwDBGrid;
    gridCentroCusto: TwwDBGrid;
    gridAtividadeProjeto: TwwDBGrid;
    gridPrograma: TwwDBGrid;
    gridTipoDespesa: TwwDBGrid;
    dsPlano: TDataSource;
    dsCentroCusto: TDataSource;
    dsPatro: TDataSource;
    dsAtividadeproj: TDataSource;
    dsPrograma: TDataSource;
    dsTipoDespesa: TDataSource;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lblPlano: TLabel;
    lblPatrocinador: TLabel;
    lblAtividadeProjeto: TLabel;
    lblCentroCusto: TLabel;
    lblPrograma: TLabel;
    lblTipoDespesa: TLabel;
    lbl13: TLabel;
    lblTotal: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVinculaOrcadoContabilparamatros: TFrmVinculaOrcadoContabilparamatros;

implementation

uses FVinculaOrcadoContabilDetalhe;

{$R *.DFM}

procedure TFrmVinculaOrcadoContabilparamatros.bbtnConfirmarClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmVinculaOrcadoContabilparamatros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFrmVinculaOrcadoContabilparamatros.FormShow(Sender: TObject);
var
  tot:integer;
begin
     pgcDados.ActivePageIndex := 0;
     lblPlano.Caption := IntToStr((dsPlano.DataSet.Recordcount) );
     lblPatrocinador.Caption := IntToStr((dsPatro.DataSet.Recordcount) );
     lblCentroCusto.Caption := IntToStr((dsCentroCusto.DataSet.Recordcount) );
     lblAtividadeProjeto.Caption := IntToStr((dsAtividadeproj.DataSet.Recordcount) );
     lblPrograma.Caption := IntToStr((dsPrograma.DataSet.Recordcount) );
     lblTipoDespesa.Caption := IntToStr((dsTipoDespesa.DataSet.Recordcount) );

     tot := dsPlano.DataSet.Recordcount + dsPatro.DataSet.Recordcount +   dsCentroCusto.DataSet.Recordcount +
            dsAtividadeproj.DataSet.Recordcount + dsPrograma.DataSet.Recordcount +   dsTipoDespesa.DataSet.Recordcount ;

     lblTotal.Caption := IntToStr((tot) );







     Application.ProcessMessages;





end;

end.
