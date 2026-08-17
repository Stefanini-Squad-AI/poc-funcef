unit fMostraLogExcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  DBClient, uCMClientDataSet, uCmSqlParams;

type
  TFrmMostraLogExcMT = class(TfrmSairAjuda)
    dbegrideleta: TwwDBGrid;
    ds: TwwDataSource;
    Cds: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMostraLogExcMT: TFrmMostraLogExcMT;

implementation

uses FConsultaLogAltExcMT;

{$R *.DFM}

procedure TFrmMostraLogExcMT.FormCreate(Sender: TObject);
var
  sql: String;
begin
  inherited;
  sql := 'SELECT CHAVEPRIMARIA, ARQUIVO, NOMECAMPO, VALORANTERIOR '{ivlm} +
           'FROM '{ivlm} + FrmConsultaLogAltExc.tabela +
         ' WHERE ( OPERACAO = ''D'' ) '{ivlm} +
            'AND ( ARQUIVO = '{ivlm} + QuotedStr( FrmConsultaLogAltExc.arquiv ) + ' ) '{ivlm} +
            'AND ( CHAVEPRIMARIA = '{ivlm} + QuotedStr( FrmConsultaLogAltExc.chave1 ) + ' ) '{ivlm} +
            'AND ( VALORANTERIOR IS NOT NULL )'{ivlm};

  Cds.Data := FrmConsultaLogAltExc.LogTabelas.GetDataPacket( sql );
end;

end.

