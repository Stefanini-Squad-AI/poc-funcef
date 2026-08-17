unit uComumRelats;

interface

uses classes, checklst, IniFiles, dbtables;

var
  IDEstab: LongInt;
  bSitAtivo, bSitAfast, bSitDemit,
  bTipContrEfet, bTipContrEspec, bTipContrTemp, bTipContrEst,
  bTipContrTerc, bTipContrProp, bTipContrAut: boolean;
  sAux, sCodEstabSel, sCodFuncSel, sCodCCustoSel, sCodTipoFolhaSel, sCodRubricaSel: string;
  ArqConfig: TIniFile;
  chkListAux: TCheckListBox;
  ListaCodEstab, ListaCodFunc, ListaCodCCusto, ListaCodRubrica, ListaCodTipoFolha: TStringList;

implementation

end.
