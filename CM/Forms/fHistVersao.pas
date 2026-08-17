unit fHistVersao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, MSXML_TLB, uSistema;

type
  TfrmHistVersao = class(TfrmSairAjuda)
    grdHistVersao: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistVersao: TfrmHistVersao;

implementation

{$R *.DFM}

procedure TfrmHistVersao.FormCreate(Sender: TObject);
var
  xml: TDOMDocument;
  x, i, z: integer;
  node: IXMLDOMNode;
  ListSistema, List: IXMLDOMNodeList;
begin
  inherited;
  x:= 0;
  grdHistVersao.Cells[0,0] := 'Versão';
  grdHistVersao.Cells[0,1] := 'Arquivo alterado';
  grdHistVersao.Cells[0,2] := 'Nº SOL';
  grdHistVersao.Cells[0,3] := 'Nº Kintana';
  grdHistVersao.Cells[0,4] := 'Descrição da Solicitação';
  grdHistVersao.Cells[0,5] := 'Data de Envio da Versão';
  try
    xml := TDOMDocument.Create(nil);
    //xml.load('C:\Documents and Settings\Administrador\Desktop\XML.Funcef\basico.xml');
    xml.Load(ParamStr(1) + '\HistVersao\HistVersao.xml');
    node := xml.documentElement.Get_firstChild;//Área
    if node.hasChildNodes then //No caso, Sistema...
    begin
      ListSistema := xml.documentElement.getElementsByTagName('sistema');
      for i := 0 to ListSistema.Length -1 do
      begin
        if (ListSistema.Item[i].firstChild.Text = Sistema.NomeAplicativo) then
        begin
          x := x + 1;
          if i >= 1 then
            grdHistVersao.RowCount := grdHistVersao.RowCount + 1;
          grdHistVersao.Cells[0,  x] := ListSistema.item[i].firstChild.Text;
          List:= xml.documentElement.lastChild.childNodes.item[i].Get_childNodes;
          for z := 1 to List.length -1 do
            grdHistVersao.Cells[z, x] := ListSistema.item[i].childNodes.Item[z].Get_text;
        end;
      end;
    end;
  finally
    FreeAndNil(xml);
  end;
end;

end.
