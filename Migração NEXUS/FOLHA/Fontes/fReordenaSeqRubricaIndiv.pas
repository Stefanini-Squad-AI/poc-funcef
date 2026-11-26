unit fReordenaSeqRubricaIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Grids, Wwdbigrd, Wwdbgrid, Db,
  Wwdatsrc, Wwquery;

type
  TfrmReordenaSeqRubricaIndiv = class(TfrmOkCancelar)
    qryRubricaIndiv: TwwQuery;
    dsRubricaIndiv: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    udpRubricaIndiv: TUpdateSQL;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReordenaSeqRubricaIndiv: TfrmReordenaSeqRubricaIndiv;

implementation

{$R *.DFM}

procedure TfrmReordenaSeqRubricaIndiv.BitBtn1Click(Sender: TObject);
var icont, iidempresa, iidtitular, iidpessoa, iidrubrica, iseq, proxseq: integer;
begin
  inherited;
  icont:=0;
  iidempresa:=0;
  iidtitular:=0;
  iidpessoa :=0;
  iidrubrica:=0;
  iseq      :=0;
  while not qryRubricaIndiv.eof do
  begin
    inc(icont);
    if icont mod 100 = 0 then
      application.processmessages;
    if qryRubricaIndiv.fieldbyname('idtitular').asinteger = 0 then
    begin
      qryRubricaIndiv.next;
      continue;
    end;
    iidempresa:=qryRubricaIndiv.fieldbyname('idempresa').asinteger;
    iidtitular:=qryRubricaIndiv.fieldbyname('idtitular').asinteger;
    iidpessoa :=qryRubricaIndiv.fieldbyname('idpessoa').asinteger;
    iidrubrica:=qryRubricaIndiv.fieldbyname('idrubrica').asinteger;
    iseq      :=qryRubricaIndiv.fieldbyname('seqrubricaindiv').asinteger;
    proxseq:=1;
    while (not qryRubricaIndiv.eof) and
          (iidempresa=qryRubricaIndiv.fieldbyname('idempresa').asinteger) and
          (iidtitular=qryRubricaIndiv.fieldbyname('idtitular').asinteger) and
          (iidpessoa =qryRubricaIndiv.fieldbyname('idpessoa').asinteger ) and
          (iidrubrica=qryRubricaIndiv.fieldbyname('idrubrica').asinteger) do
    begin
      if iseq > proxseq then
      begin
        qryRubricaIndiv.edit;
        qryRubricaIndiv.fieldbyname('seqrubricaindiv').asinteger:=proxseq;
        qryRubricaIndiv.post;
      end;
      inc(proxseq);
      qryRubricaIndiv.next;
      iseq:=qryRubricaIndiv.fieldbyname('seqrubricaindiv').asinteger;
    end;
  end;
  qryRubricaIndiv.applyupdates;
end;

procedure TfrmReordenaSeqRubricaIndiv.bbtnSairClick(Sender: TObject);
begin
  inherited;
  qryRubricaIndiv.cancelupdates;
end;

procedure TfrmReordenaSeqRubricaIndiv.FormCreate(Sender: TObject);
begin
  inherited;
  qryRubricaIndiv.open;
end;

procedure TfrmReordenaSeqRubricaIndiv.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  qryRubricaIndiv.applyupdates;
end;

end.
