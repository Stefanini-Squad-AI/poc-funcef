unit FGeraArqSaidaGenerica;

// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, wwdblook, uSistema;

type
  TFrmOkCancelar1 = class(TFrmOkCancelar)
    qrySaidaGenerica: TwwQuery;
    Panel1: TPanel;
    grbSaidaGenerica: TGroupBox;
    dblkSaidaGenerica: TwwDBLookupCombo;
    dbgParametros: TwwDBGrid;
    qryParametros: TwwQuery;
    dsParametros: TwwDataSource;
    Panel2: TPanel;
    lblCaminho: TLabel;
    lbNomeArqGerado: TLabel;
    BevelArqGerado: TBevel;
    bbtnSalvar: TBitBtn;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOkCancelar1: TFrmOkCancelar1;

implementation

{$R *.DFM}

procedure TFrmOkCancelar1.FormCreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana SOL 109421 KINTANA 496332
        lbNomeArqGerado.Caption:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.
